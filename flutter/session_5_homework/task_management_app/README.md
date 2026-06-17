# Task Management App

A simple Flutter task management app for creating and tracking daily tasks, built with **clean feature-first architecture**.

The app lets users add new tasks, mark tasks as completed, delete tasks, and view a friendly empty state when no tasks are available.

## Features

- Add a new task from the input field at the bottom of the screen.
- Display all tasks in a scrollable list.
- Mark tasks as completed or active.
- Show completed tasks with a strikethrough style.
- Delete tasks from the list.
- Display each task's creation date.
- Show an empty-state message when the task list is empty.
- Tasks are persisted locally using Hive (data survives app restarts).

## Demo

https://github.com/user-attachments/assets/83b46959-a80d-4fb8-90ab-f4b489ab76e7

## Tech Stack

- **Flutter** & **Dart**
- **Cubit** (flutter_bloc) for state management
- **Hive** for local data persistence
- **intl** for date formatting
- Material Design widgets

## Architecture

The project follows a **clean feature-first architecture** with clear separation of concerns:

- **Repository Pattern** — Cubits don't access Hive directly; all data operations go through `TasksRepo`.
- **Feature-first structure** — Each feature is self-contained under `features/`.
- **Separation of concerns** — Data layer (models, repos), Presentation layer (cubits, UI) are clearly separated.

## Project Structure

```text
lib/
├── main.dart
├── core/
│   ├── bloc/
│   │   └── simple_bloc_observer.dart
│   ├── constants/
│   │   └── app_constants.dart
│   └── theme/
│       ├── app_colors.dart
│       └── app_styles.dart
└── features/
    └── tasks/
        ├── data/
        │   ├── models/
        │   │   ├── task_model.dart
        │   │   └── task_model.g.dart
        │   └── repos/
        │       └── tasks_repo.dart
        └── presentation/
            ├── cubit/
            │   ├── add_task/
            │   │   ├── add_task_cubit.dart
            │   │   └── add_task_state.dart
            │   └── tasks/
            │       ├── tasks_cubit.dart
            │       └── tasks_state.dart
            └── ui/
                ├── my_tasks_view.dart
                └── widgets/
                    ├── add_task_text_field.dart
                    ├── no_tasks_widget.dart
                    ├── task_item.dart
                    └── tasks_list_view_widget.dart
```

## Getting Started

### Prerequisites

Make sure Flutter is installed and configured on your machine.

Check your Flutter setup:

```bash
flutter doctor
```

### Installation

Clone the project and install dependencies:

```bash
flutter pub get
```

### Run the App

Run the app on an available emulator, simulator, browser, or connected device:

```bash
flutter run
```

## Key Files

| File | Description |
|------|-------------|
| `main.dart` | App entry point — initializes Hive, registers adapters, provides `TasksCubit` |
| `tasks_repo.dart` | Repository that handles all Hive data operations |
| `tasks_cubit.dart` | Manages task list state (fetch, toggle, delete) |
| `add_task_cubit.dart` | Manages add-task flow (loading, success, failure) |
| `my_tasks_view.dart` | Main screen — displays task list or empty state |
| `add_task_text_field.dart` | Input field with add button and loading indicator |
| `task_item.dart` | Single task card with toggle and delete actions |
| `task_model.dart` | Hive-annotated data model for tasks |

## Notes

- Tasks are stored locally using **Hive** and persist across app restarts.
- The app does not use any external API or remote database.
