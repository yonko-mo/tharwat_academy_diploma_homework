# 🛒 Grocery App

A Flutter e-commerce application for browsing and discovering grocery deals. It features Firebase Authentication, Firestore data persistence, local user caching with SharedPreferences, and a clean feature-based architecture.

---

## 📹 Demo Video

https://github.com/user-attachments/assets/5df9a18c-52f5-4ded-8716-14c120591de0

---

## ✨ Features

- **Splash Screen** — Checks Firebase Auth state and routes the user to Home or Onboarding automatically
- **Onboarding** — Multi-page intro carousel, shown **only once** (skipped permanently after first login via `SharedPreferences`)
- **Sign Up** — Register with email & password; user data is stored in **Firestore** and the onboarding-seen flag is saved locally
- **Sign In** — Authenticate via **Firebase Auth**; user document fetched from **Firestore** once and then cached in **SharedPreferences** for all future sessions
- **Home Screen** — Personalized greeting using cached user data, trending deals grid, and bottom navigation bar
- **Offline-first Auth** — On every app restart, the splash screen reads the user from local storage — **zero Firestore reads** after the first login

---

## 🏗️ Architecture

The project follows a **feature-first clean architecture**:

```
lib/
├── app_constants.dart          # Global constant keys
├── main.dart                   # App entry point & initialization
├── core/
│   ├── constants/              # Generated asset references
│   ├── errors/                 # Custom exception handling
│   ├── helper/                 # Validators, snackbar helpers
│   ├── services/               # Firebase Auth, Firestore, Local Storage
│   ├── shared_preferences_singleton.dart
│   ├── theme/                  # Colors, styles
│   └── widgets/                # Reusable UI components
└── features/
    ├── authentication/
    │   ├── data/repos/         # FirebaseAuthRepo (data source)
    │   ├── domain/
    │   │   ├── models/         # UserModel
    │   │   └── repos/          # AuthRepo (abstract interface)
    │   └── presentation/
    │       ├── cubits/         # SignInCubit, CreateAccountCubit
    │       └── ui/             # Views & widgets
    ├── home/
    ├── onboarding/
    └── splash/
```

---

## 🔧 Tech Stack

| Category | Package |
|---|---|
| State Management | [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) |
| Backend Auth | [`firebase_auth`](https://pub.dev/packages/firebase_auth) |
| Database | [`cloud_firestore`](https://pub.dev/packages/cloud_firestore) |
| Local Storage | [`shared_preferences`](https://pub.dev/packages/shared_preferences) |
| Loading Overlay | [`modal_progress_hud_nsn`](https://pub.dev/packages/modal_progress_hud_nsn) |
| Navigation Bar | [`custom_navigation_bar`](https://pub.dev/packages/custom_navigation_bar) |
| Fonts | Poppins, Inter, DM Sans |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `^3.12.2`
- A Firebase project with **Authentication** and **Firestore** enabled

### Setup

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd grocery_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**

   Add your `google-services.json` (Android) and/or `GoogleService-Info.plist` (iOS) to the respective platform directories. The `firebase_options.dart` file is already generated.

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 📱 Screens

| Screen | Description |
|---|---|
| Splash | Checks auth state; routes to Home or Onboarding |
| Onboarding | 3-page intro carousel (shown once) |
| Sign In | Email/password login via bottom sheet |
| Create Account | Registration form with terms & conditions |
| Home | Greeting, trending deals grid, "More" button |

---

## 🗂️ Key Implementation Notes

### 🔥 Firebase Authentication

User registration and login are handled entirely by **Firebase Auth**. The `FirebaseAuthService` wraps `createUserWithEmailAndPassword` and `signInWithEmailAndPassword`. After registration, the user is signed out immediately so they must explicitly log in.

### 🗄️ Firestore — User Data

When a user registers, their `firstName`, `lastName`, and `email` are saved as a document in the `users` Firestore collection, keyed by their Firebase UID. On first sign-in, this document is fetched to build the `UserModel`.

### 💾 SharedPreferences — Two Use Cases

The app uses `SharedPreferences` for two distinct persistence needs:

#### 1. Skip Onboarding After First Login

When a user successfully signs in or creates an account, the flag `onboarding_seen = true` is written to `SharedPreferences`. This ensures the onboarding flow is never shown again after the first session.

```
Sign In / Create Account success → setBool('onboarding_seen', true)
App restart (logged in) → routed directly to HomeView, onboarding skipped
```

#### 2. Cache Authenticated User — Avoid Firestore on Restart

After a successful sign-in, the fetched `UserModel` is serialized to JSON and stored in `SharedPreferences` under the key `cached_user`. On every subsequent app launch, the splash screen reads this local cache instead of making a Firestore network request.

```
First Sign In  → Firebase Auth → Firestore fetch → SharedPreferences.save → HomeView
App restart    → Firebase Auth check → SharedPreferences.read → HomeView  ✅ no Firestore
```

The `UserLocalStorageService` manages this with three methods:
- `saveUser(UserModel)` — serializes and saves after sign-in
- `getUser()` — deserializes and returns cached user on splash
- `clearUser()` — call this on sign-out to wipe local data

---
