# Chatbot App 🤖

A beautiful, modern, and highly responsive Flutter chatbot application powered by the Google Gemini AI model. Built using clean architecture principles and robust state management.

---

## 🚀 Features

- **Gemini 3.5 Flash Integration**: Real-time AI chat powered by Google's `gemini-3.5-flash` model.
- **Robust State Management**: Powered by `flutter_bloc` (Cubit) to handle user inputs, loading states, success messages, and connection failures seamlessly.
- **Dynamic Suggestions**: Quick starter prompt cards (under categories like *Explain*, *Write and Edit*, *Translate*) to quickly test out the model with standard questions.
- **Failure Recovery / Retry Support**: Enhanced chat flow displaying error/failure bubbles on connection problems with instant "Retry" functionality.
- **Beautiful & Curated Typography**: Styled using the `Nunito` font family for modern, rounded, and premium UI readability.
- **Orientation Lock**: Optimized for portrait-only layouts.
- **Onboarding and Splash Screen**: Interactive welcome experience for first-time users.

---

## 🛠️ Tech Stack & Libraries

- **Framework**: [Flutter](https://flutter.dev) (Dart SDK `^3.12.0`)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc) (`^9.1.1`)
- **HTTP client**: [Dio](https://pub.dev/packages/dio) (`^5.9.2`)
- **Local Storage**: [shared_preferences](https://pub.dev/packages/shared_preferences) (`^2.5.5`)

---

## 📂 Project Structure

The codebase is organized cleanly to separate shared resources from feature-specific modules:

```text
lib/
├── core/                               # Shared configurations, widgets, network, & themes
│   ├── constants/                      # Global asset constants
│   ├── network/                        # Base API client & custom network exceptions wrapper
│   ├── theme/                          # Color palettes & typography styles
│   └── widgets/                        # Shared UI components
│
├── features/                           # Feature modules
│   ├── chat/                           # Gemini Chat Feature
│   │   ├── data/
│   │   │   ├── models/                 # Message content structures (role, parts, etc.)
│   │   │   ├── repos/                  # Repositories for data orchestration
│   │   │   └── services/               # API service calling Gemini endpoint
│   │   └── presentation/
│   │       ├── cubit/                  # BLoC state management logic
│   │       └── ui/                     # UI screens & state-specific sub-widgets
│   │
│   ├── onboarding/                     # Onboarding Screen Flow
│   └── splash/                         # Splash Screen Feature
│
├── secrets.dart                        # API Key credentials configuration (gitignored)
└── main.dart                           # Main application entry point
```

---

## ⚙️ Getting Started & Setup

### 1. Prerequisites
Before running the app, ensure you have the [Flutter SDK installed](https://docs.flutter.dev/get-started/install) on your development machine.

### 2. Clone the Repository
```bash
git clone <repository-url>
cd chatbot_app
```

### 3. Install Dependencies
Run the following command to retrieve all pub packages:
```bash
flutter pub get
```

### 4. Configure Gemini API Key
To authenticate with Google's generative language API, you will need a Gemini API Key. You can get one from the [Google AI Studio](https://aistudio.google.com/).

Once you have your API Key:
1. Create a file named `secrets.dart` in the `lib/` directory:
   ```bash
   # In chatbot_app/lib/
   touch secrets.dart
   ```
2. Open `lib/secrets.dart` and define your API key:
   ```dart
   const apiKey = 'YOUR_GEMINI_API_KEY_HERE';
   ```

*(Note: Ensure that `secrets.dart` is added to your `.gitignore` to prevent committing sensitive keys to public repositories).*

### 5. Running the Application
Connect a device or emulator, then execute:
```bash
flutter run
```
