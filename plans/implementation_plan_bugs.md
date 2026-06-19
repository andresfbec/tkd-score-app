# Fix: Estado incorrecto en combates Participante vs Bye

## Descripción del problema

Cuando el organizador confirma el orden de la Ronda 1, el usecase `ResolveByes`
marca correctamente los enfrentamientos de tipo "Participante vs Bye" con
`state: 'completed'` y asigna el `winnerInscriptionId` en la entidad `VersusEntity`.

**Sin embargo**, al entrar a la página de ejecución de uno de esos combates, la
interfaz muestra todos los rounds como `pending`/bloqueados y no refleja que el
combate ya está resuelto. El botón "Ejecutar Combate" puede aparecer activo, y el
ganador no se muestra.

Esto ocurre por **tres bugs independientes pero encadenados** que se describen a continuación.

---

## Bug #1 — `ResolveByes` no actualiza los `CombatRoundsEntity`

### Descripción

`ResolveByes` opera exclusivamente sobre `VersusEntity`. Cuando resuelve un bye,
actualiza el `versus` en la BD con `state: 'completed'` y `winnerInscriptionId`,
pero los `CombatRoundsEntity` asociados a ese versus **nunca se modifican**:
permanecen en `state: 'pending'`, `pointsA: 0`, `pointsB: 0`, `winnerInscriptionId: null`.

### Evidencia en código

```dart
// resolve_byes_usecase.dart — líneas 26-31
final updatedBye = bye.copyWith(
  winnerInscriptionId: bye.inscriptionAId,
  state: 'completed',   // ← Solo toca VersusEntity
);
await repository.update(updatedBye);
// ← No hay ninguna llamada a CombatRoundsRepository
```

### Solución propuesta

Inyectar `CombatRoundsRepository` en `ResolveByes` y, por cada bye resuelto,
recuperar sus rounds y marcar **todos** como `completed` con
`winnerInscriptionId = inscriptionAId`.

#### [MODIFY] [resolve_byes_usecase.dart](file:///c:/ProyectosFlutter/tkd_score/lib/domain/usecases/versus/resolve_byes_usecase.dart)

```diff
- class ResolveByes {
-   final VersusRepository repository;
-   ResolveByes(this.repository);

+ class ResolveByes {
+   final VersusRepository repository;
+   final CombatRoundsRepository combatRoundsRepository;
+   ResolveByes(this.repository, this.combatRoundsRepository);

  Future<void> call(int groupId) async {
    final round1Versus = await repository.getByGroupAndRound(groupId, 1);
    final byes = round1Versus.where((vs) => vs.inscriptionBId == null).toList();

    for (var bye in byes) {
      if (bye.inscriptionAId != null) {
        await repository.update(bye.copyWith(
          winnerInscriptionId: bye.inscriptionAId,
          state: 'completed',
        ));

+       // Marcar todos los combat rounds del bye como completed
+       final rounds = await combatRoundsRepository.getByVersusId(bye.id!);
+       for (final round in rounds) {
+         await combatRoundsRepository.update(
+           round.copyWith(
+             state: 'completed',
+             winnerInscriptionId: bye.inscriptionAId,
+             endAt: DateTime.now(),
+           ),
+         );
+       }
      }
    }
  }
}
```

> [!IMPORTANT]
> La inyección de `ResolveByes` debe actualizarse en el punto donde se
> instancia (DI / provider). Verificar si se construye en un `MultiProvider`
> o en un archivo de inyección de dependencias.

---

## Bug #2 — `_updateStateAndWinner` ignora `versus.winnerInscriptionId` de la BD

### Descripción

El método `_updateStateAndWinner` en `CombatRoundsController` **recalcula**
el ganador desde cero evaluando los `CombatRoundsEntity`, sin leer el campo
`winnerInscriptionId` que ya está persistido en `VersusEntity`. Para un bye,
aunque el versus tenga `winnerInscriptionId != null` en BD, el controlador
lo ignora por completo.

Adicionalmente, cuando `inscriptionBId` es `null` (bye), el controller hace:

```dart
// combat_rounds_controller.dart — línea 167
inscriptionBId: _versus!.inscriptionBId ?? 0,  // ← null → 0
```

Esto hace que `EvaluateVersusCompletion` compare contra el ID `0`, que nunca
coincide con ningún round, devolviendo `null` indefinidamente.

### Evidencia en código

```dart
// combat_rounds_controller.dart — líneas 160-174
void _updateStateAndWinner() {
  if (_versus == null || _combatSettings == null) return;

  // ← Recalcula siempre desde los rounds. Nunca mira _versus.winnerInscriptionId
  _matchWinnerId = evaluateVersusCompletionUseCase(
    settings: _combatSettings!,
    rounds: _rounds,
    inscriptionAId: _versus!.inscriptionAId ?? 0,
    inscriptionBId: _versus!.inscriptionBId ?? 0,  // ← BYE = 0, bug
  );

  _executableRound = getExecutableRoundUseCase(
    rounds: _rounds,
    matchWinnerId: _matchWinnerId,
  );
}
```

### Solución propuesta

Agregar un **cortocircuito al inicio** de `_updateStateAndWinner`: si
`_versus.winnerInscriptionId` ya tiene un valor (el versus está resuelto en BD),
usarlo directamente sin evaluar rounds.

#### [MODIFY] [combat_rounds_controller.dart](file:///c:/ProyectosFlutter/tkd_score/lib/presentation/controllers/combat_rounds_controller.dart)

```diff
  void _updateStateAndWinner() {
    if (_versus == null || _combatSettings == null) return;

+   // Cortocircuito: si el versus ya tiene un ganador en BD (ej. bye resuelto),
+   // usarlo directamente sin recalcular desde los rounds.
+   if (_versus!.winnerInscriptionId != null) {
+     _matchWinnerId = _versus!.winnerInscriptionId;
+     _executableRound = null; // No hay round ejecutable si ya hay ganador
+     return;
+   }

    _matchWinnerId = evaluateVersusCompletionUseCase(
      settings: _combatSettings!,
      rounds: _rounds,
      inscriptionAId: _versus!.inscriptionAId ?? 0,
      inscriptionBId: _versus!.inscriptionBId ?? 0,
    );

    _executableRound = getExecutableRoundUseCase(
      rounds: _rounds,
      matchWinnerId: _matchWinnerId,
    );
  }
```

> [!NOTE]
> Esta corrección es la más crítica porque es la que alimenta directamente
> a la UI. Incluso si el Bug #1 no se corrige, este fix haría visible el
> estado correcto del bye en pantalla.

---

## Bug #3 — La UI no tiene rama visual para un combate tipo Bye

### Descripción

`CombatRoundsExecutionPage` no distingue entre un combate real y un bye.
Cuando entra a un bye, aunque (después del fix #2) `winnerId != null`,
la página muestra:

1. La lista de rounds en estado bloqueado/pendiente — confuso para el usuario.
2. Un card de "Ganador Determinado" con solo `ID Ganador: X` sin contexto.
3. El nombre del competidor B aparece como `"Competidor Rojo"` (fallback)
   porque `inscriptionBId` es `null` y no hay inscripción que cargar.
4. El header dice `"Juan vs Competidor Rojo"` — incorrecto.

### Solución propuesta

Agregar en `CombatRoundsController` una propiedad computada `isByeMatch`
y en la UI una rama visual dedicada que reemplace toda la lista de rounds
con un panel informativo claro.

#### [MODIFY] [combat_rounds_controller.dart](file:///c:/ProyectosFlutter/tkd_score/lib/presentation/controllers/combat_rounds_controller.dart)

```diff
+ /// Retorna true si este versus es un BYE (participante sin oponente).
+ bool get isByeMatch => _versus?.inscriptionBId == null;
```

#### [MODIFY] [combat_rounds_execution_page.dart](file:///c:/ProyectosFlutter/tkd_score/lib/presentation/pages/tournaments/combat_rounds_execution_page.dart)

En `_buildContent`, antes del bloque de lista de rounds, agregar:

```dart
// Si es un bye, mostrar pantalla informativa en lugar de la lista de rounds
if (controller.isByeMatch) {
  return _buildByeResolutionView(context, controller);
}
```

Y añadir el método privado:

```dart
Widget _buildByeResolutionView(
  BuildContext context,
  CombatRoundsController controller,
) {
  final winnerName = controller.competitorAName;

  return Center(
    child: Card(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(FluentIcons.skype_check, size: 48, color: Colors.green),
          const SizedBox(height: 16),
          Text(
            'Combate resuelto — BYE',
            style: FluentTheme.of(context).typography.title,
          ),
          const SizedBox(height: 8),
          Text(
            '$winnerName avanza automáticamente a la siguiente ronda.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Volver al Bracket'),
          ),
        ],
      ),
    ),
  );
}
```

> [!NOTE]
> El header del `ScaffoldPage` también debe ajustarse para mostrar
> `"$nameA — BYE"` cuando `controller.isByeMatch` sea `true`.

---

## Orden de implementación recomendado

Los bugs son independientes en código pero encadenados en efecto visual.
El orden que minimiza el riesgo de regresión es:

| # | Archivo | Tipo | Impacto |
|---|---|---|---|
| 1 | `resolve_byes_usecase.dart` | Dominio | Garantiza consistencia en BD |
| 2 | `combat_rounds_controller.dart` | Presentación | Expone el estado correcto a la UI |
| 3 | `combat_rounds_execution_page.dart` | Presentación | Muestra la UI correcta al usuario |

---

## Plan de verificación

### Prueba manual paso a paso

1. Crear un torneo con **5 participantes** en un grupo (generará 3 byes).
2. Generar el bracket del grupo.
3. Verificar en el bracket que hay 3 combates de Ronda 1 con "BYE".
4. Confirmar el orden de la Ronda 1 (esto ejecuta `ResolveByes`).
5. Entrar a uno de los combates de Participante vs BYE.
6. **Esperado después del fix:** Ver la pantalla `_buildByeResolutionView`
   con el nombre del participante y el mensaje de avance automático.
7. Verificar en la BD que los `combat_rounds` de ese versus tienen
   `state = 'completed'` y `winner_inscription_id` correcto.
8. Volver al bracket y verificar que el ganador aparece en la Ronda 2.

### Regresión — combates normales

9. Ejecutar un combate real (sin bye) y verificar que el flujo de
   `_updateStateAndWinner` sigue funcionando con el recálculo por rounds.
   (El cortocircuito del fix #2 solo actúa si `winnerInscriptionId != null`
   en BD, que para un combate no finalizado siempre será `null`.)
