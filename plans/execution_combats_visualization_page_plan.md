# Plan de Visualización y Ejecución de Combates (Estructura Piramidal)

Este plan detalla la estrategia para implementar la vista de ejecución de combates, la lógica de *byes* y la interactividad de *Drag & Drop* para organizar las llaves.

## User Review Required

> [!IMPORTANT]
> El plan ha sido actualizado con los nuevos requerimientos sobre el flujo de las rondas. 
> Por favor revisa la sección **Flujo de Ejecución de Rondas** para asegurarte de que captura exactamente cómo esperas que funcione el bloqueo y avance del torneo.

## Lógica Matemática (Generación de Llaves y Byes)

1. **Agrupamiento Inicial Aleatorio:** Al abrir el grupo, el sistema empareja a los participantes al azar.
2. **Tamaño de la Llave (Potencia de 2):**
   - El número de nodos hoja (casillas iniciales) debe ser la potencia de 2 más cercana mayor o igual al número de participantes ($P$).
   - Fórmula: $N = 2^{\lceil \log_2(P) \rceil}$. (Ejemplo: 5 participantes -> Tamaño 8).
3. **Cálculo de Byes:**
   - Cantidad de Byes = $N - P$. (Ejemplo: 8 - 5 = 3 Byes).
   - Un *Bye* significa que el participante en esa rama no tiene oponente inicial y avanza automáticamente a la siguiente ronda.
   - Los Byes se distribuirán en la estructura de forma equitativa.

## Arquitectura de UI (El Enfoque Híbrido)

### 1. El Layout Base
Utilizaremos un `Row` principal (con scroll horizontal) que contendrá varias `Column`. Cada `Column` representa una ronda del torneo (ej. Octavos, Cuartos, Semis, Final).

### 2. Las Casillas (Nodos Interactivos)
Cada nodo del árbol será un Widget que envuelve:
- `Draggable<Participant>`: Para que el usuario pueda levantar al participante.
- `DragTarget<Participant>`: Para recibir a un participante.
- Intercambio (Swap) permitido únicamente con participantes **del mismo grupo**.

### 3. Líneas Conectoras
Se colocará el `Row` principal sobre un `CustomPaint` usando un `Stack`. 
Se utilizarán `GlobalKey`s o constraints de layout para que el `CustomPainter` dibuje líneas desde el centro derecho de un combate hacia el combate de la siguiente ronda.

## Flujo de Ejecución de Rondas (Estado de la Llave)

Se definen 3 estados para cada Ronda:
1. **Configuración (Borrador):**
   - Es la ronda actual (ej. Octavos de final al iniciar).
   - **Permite Drag & Drop** libremente para ordenar los enfrentamientos.
   - Mostrará un botón destacado: **"Confirmar Enfrentamientos de la Ronda"**.
2. **En Ejecución (Confirmada):**
   - El usuario presionó el botón de Confirmar.
   - **El Drag & Drop queda bloqueado permanentemente** para esta ronda.
   - Los combates ya se pueden ejecutar en la app.
   - El operador puede ejecutar los combates de esta ronda **en cualquier orden** (ej. combate 3, luego 1, luego 4).
3. **Completada:**
   - Todos los combates de esta ronda tienen un ganador asignado.
   - Solo al completar el 100% de la ronda actual, el sistema avanza a la siguiente ronda, la cual pasará a estado de "Configuración (Borrador)".

## Estructura de Datos Propuesta

Se requerirá un modelo para manejar el estado del árbol y de la ronda:

```dart
enum RoundState { configuration, execution, completed }

class BracketRound {
  final int roundIndex;
  RoundState state;
  List<MatchNode> matches;
  
  bool get isAllMatchesFinished => matches.every((m) => m.winner != null);
}

class MatchNode {
  final String id;
  Participant? player1; // Puede ser null si hay un Bye
  Participant? player2; // Puede ser null si hay un Bye
  Participant? winner;
  MatchNode? nextMatch; 
  
  bool get isBye => player1 == null || player2 == null;
}
```

## Resumen de Tareas
1. **Modelado de Datos:** Crear la lógica que recibe los participantes, calcula Byes, y genera la lista de rondas (`BracketRound`) y combates (`MatchNode`).
2. **Lógica de Estado (Provider/Riverpod/Bloc):** Implementar el estado que controle el `RoundState`, el bloqueo de `Drag & Drop` y el avance de ronda.
3. **Componente Visual de Casilla:** Crear el widget reutilizable `MatchCell`.
4. **Vista Principal del Bracket:** Implementar el layout de columnas por ronda y el botón "Confirmar Ronda" que se muestra solo en la ronda activa si no está confirmada.
5. **Painter de Conectores:** Dibujar líneas entre llaves.
