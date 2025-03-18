# BaridX Flutter App

## Overview
A multi-step order creation app built with **Cubit (Bloc) for state management**, **GoRouter for navigation**, and **GetIt for Dependency Injection**. Designed with clean architecture for scalability and maintainability.

## Installation & Setup
### Prerequisites
Ensure you have the following installed:
- **Flutter**: `3.24.4`
- **Dart** (Dart SDK version: 3.5.4 (stable))
- **Android Studio / VS Code** (Recommended for development)
- **Android/iOS emulator or physical device**

### Clone the Repository
```sh
git clone https://github.com/Muzammil-crypto/baridX
cd baridx
```

### Install Dependencies
Run the following command to fetch all dependencies:
```sh
flutter pub get
```

### Run the App
To run the app on an emulator or a connected device:
```sh
flutter run
```

For a specific platform:
```sh
flutter run -d android   # Runs on Android
flutter run -d ios       # Runs on iOS (requires macOS and Xcode)
```

## Dependencies Used
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  go_router: ^14.8.1
  flutter_bloc: ^9.1.0
  get_it: ^8.0.3
  sizer: ^3.0.4

dev_dependencies:
  flutter_test:
    sdk: flutter
```

## Key Architectural Decisions

### Why This Folder Structure?
- **Separation of Concerns**: Organizing the app into `core`, `data`, `logic`, `presentation`, and `routes` ensures clear responsibility for each layer.
- **Scalability**: Keeps the codebase manageable, allowing easy expansion.
- **Maintainability**: Prevents refactoring overhead as features grow.

### Why Avoid MultiBlocProvider in Root?
- **Efficiency**: Wrapping all Cubits in `MultiBlocProvider` would mean every screen subscribes to all states, even when unnecessary.
- **Scoped State Management**: Using `GetIt`, Cubits are only initialized when required, improving performance.

```dart
locator.registerLazySingleton(() => CustomerInfoCubit());
locator.registerFactory(() => OrderCubit(locator<OrderRepository>()));
```

### Why Implement a Complete API Flow Instead of `Future.delayed()`?
- **Real-World Scalability**: A structured API request flow mimics production scenarios.
- **Better Error Handling**: Allows retries, error states, and clean separation of business logic from UI.
- **Extendability**: This approach makes it easy to integrate real backend APIs in the future.

### Why Keep Validators, Strings, Dimensions, Styles, and Constants Separate?
- **Consistency**: Centralized configuration ensures uniform styles and text usage across the app.
- **Ease of Maintenance**: Updating a color, text, or dimension does not require modifying multiple files.
- **Localization & Theming Ready**: Makes future enhancements (dark mode, multilingual support) effortless.

### Why Modularize Code for a Small Project?
- **Future-Proofing**: Avoids tightly coupled logic, making scaling easier.
- **Code Reusability**: Encourages writing reusable components and utilities.
- **Easier Debugging**: Separating UI, business logic, and network layers simplifies debugging.

### Why Create a General AppLayout for All Screens?
- **Consistency Across Screens**: A shared layout ensures uniform structure.
- **Reduces Code Duplication**: Common UI elements like **AppBar, BackButton, Scaffolding** are handled in one place.
- **Faster Development**: Saves time by eliminating the need to repeatedly define layout components.

### Why Separate Styles, Colors, and Other Concerns into Individual Files?
- **Scalability**: Prevents bloated UI files and maintains a clear separation between **design and logic**.
- **Customizability**: Enables easy swapping of themes, typography, or assets without affecting business logic.
- **Best Practice**: Keeps the UI layer clean and maintainable.

## Optimizations
- **Lazy Initialization** for optimized memory management.
- **Scoped State Handling** to prevent unnecessary rebuilds.
- **Reusable UI Components & Layouts** for efficiency.
- **Structured API Handling** for scalability.
- **Centralized Dialog Management** for global UI alerts.
