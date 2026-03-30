
# TKD Score App

![Flutter](https://img.shields.io/badge/Flutter-Framework-blue?logo=flutter)
![Platform](https://img.shields.io/badge/Platform-Windows-blue)
![Status](https://img.shields.io/badge/Status-En%20Desarrollo-orange)
![Architecture](https://img.shields.io/badge/Architecture-Clean%20Architecture-green)

---

## Descripción

TKD Score es una aplicación desarrollada en Flutter para la gestión, desarrollo, ejecución y auditoría de torneos de Taekwondo, enfocada en las modalidades de Poomsae y Combate.

Su objetivo es ofrecer una solución integral para la organización de eventos deportivos, con un enfoque en flexibilidad, análisis de datos y manejo de escenarios reales.

---

## Funcionalidades principales

- Personalización de torneos según modalidad y reglas
- Gestión de alumnos y sedes
- Estadísticas detalladas por alumno y sede
- Recolección y graficación de mediciones en combate
- Organización automática y sugerida de llaves
- Administración de grupos y categorías
- Manejo de escenarios reales (ausencias, retiros, imprevistos)
- Funcionamiento 100% offline
- Distribución como ejecutable (.exe) para Windows

---

## Tecnologías utilizadas

- Flutter + Dart
- Drift ORM (persistencia y generación de código)
- Clean Architecture
- SQLite (base de datos local)

---

## Estado del proyecto

Actualmente en fase inicial de desarrollo.

El ejecutable para Windows aún no está disponible públicamente, ya que el proyecto está orientado a una futura distribución bajo licencia comercial.

---

## Comando técnico

Para regenerar los archivos de base de datos (.g.dart):

    flutter pub run build_runner build --delete-conflicting-outputs

---

## Equipo de desarrollo

- Andrés Felipe Malaver
- Ever Giraldo

---

## Roadmap

- Finalización del ejecutable para Windows
- Integración de más modalidades de Taekwondo
- Exportación de resultados en PDF
- Panel de administración avanzado para árbitros y jueces

---

## Licencia

Este proyecto se encuentra en desarrollo y será distribuido bajo licencia comercial.  
Los detalles de costos y licenciamiento aún están en definición.
