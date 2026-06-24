# Task Management App

A simple Flutter task management app for creating and tracking daily tasks, built with **clean feature-first architecture** and local state management.

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
- **Hive CE** (Community Edition) for local data persistence
- **intl** for date formatting
- Material Design widgets

## Architecture & Code Decisions

The project follows a **clean feature-first architecture** with clear separation of concerns:

- **Direct Hive Access** — Following review, the repository layer (`TasksRepo`) was removed since direct local storage via Hive is sufficient and cleaner without remote/external API interactions.
- **Hive CE Code Generation** — Migrated to the modern `@GenerateAdapters` pattern of Hive CE. Adapters are generated and registered globally using `Hive.registerAdapters()`.
- **Single Responsibility Cubits** — Separated tasks loading, task addition, and task deletion into dedicated cubits (`TasksCubit`, `AddTaskCubit`, `DeleteTaskCubit`).
- **Feature-first structure** — Each feature is self-contained under `features/`.

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
├── hive/
│   ├── hive_adapters.dart
│   ├── hive_adapters.g.dart
│   └── hive_registrar.g.dart
└── features/
    └── tasks/
        ├── data/
        │   └── models/
        │       └── task_model.dart
        └── presentation/
            ├── cubit/
            │   ├── add_task/
            │   │   ├── add_task_cubit.dart
            │   │   └── add_task_state.dart
            │   ├── delete_task/
            │   │   ├── delete_task_cubit.dart
            │   │   └── delete_task_state.dart
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

### Run Code Generation

Generate the Hive adapters and registrars:

```bash
dart run build_runner build --delete-conflicting-outputs
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
| `hive_adapters.dart` | Centralized Hive adapter definition using Hive CE's `@GenerateAdapters` |
| `tasks_cubit.dart` | Manages fetching the task list state |
| `add_task_cubit.dart` | Manages add-task flow (loading, success, failure) |
| `delete_task_cubit.dart` | Manages deleting tasks |
| `my_tasks_view.dart` | Main screen — displays task list or empty state |
| `add_task_text_field.dart` | Input field with add button and loading indicator |
| `task_item.dart` | Single task card with toggle and delete actions |
| `task_model.dart` | Clean data model for tasks |

## Notes

- Tasks are stored locally using **Hive CE** and persist across app restarts.
- The app does not use any remote database.
