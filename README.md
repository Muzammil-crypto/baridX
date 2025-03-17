# BaridX Flutter App

### Overview
A multi-step order creation app built with **Cubit (Bloc) for state management**, **GoRouter for navigation**, and **GetIt for Dependency Injection**. Designed with clean architecture for scalability and maintainability.

### Key Decisions
#### Why Cubit?
- Lightweight with minimal boilerplate.
- Keeps business logic independent from UI.
- Efficiently manages multi-step state.

#### Why Avoid MultiBlocProvider in Root?
- Prevents an unnecessarily bloated widget tree.
- Scoped state management ensures efficiency.
```dart
locator.registerLazySingleton(() => CustomerInfoCubit());
locator.registerFactory(() => OrderCubit(locator<OrderRepository>()));
```

#### Why GetIt for Dependency Injection?
- Enables global access without manual dependency passing.
- Lazy initialization optimizes resource usage.
- Maintains loose coupling for flexibility.
```dart
final paymentCubit = locator<PaymentCubit>();
```

#### Why GoRouter?
- Declarative and structured routing.
- Custom transitions for a seamless UI experience.
```dart
static void goPayment() => locator<GoRouter>().push(paymentRoute);
```

### Core Features
#### Global DialogService
- Centralized dialog handling without requiring context.
- Prevents memory leaks and improves efficiency.

#### Complete API Flow Implementation
- Replaced `Future.delayed()` with a structured API request flow.
- Enhances scalability and maintains separation of concerns.

#### Modularized Code
- UI styles, strings, and dimensions are extracted into separate files.
- Complex UI elements are broken into reusable widgets.

#### General AppLayout for Reusability
- Standardized layout for screens with shared UI elements.
- Increases consistency and reduces redundant code.

#### Validators & Form Handling
- Implemented validation logic using custom validators and loggers.
- Improved form handling for a better user experience.

#### UI Enhancements
- Added an **IntroScreen** with onboarding slides and a **Splash Screen**.
- Created a **HomeScreen** with additional UI details.

### Folder Structure
```
lib/
│── core/                 # Constants, Utilities, API Configurations
│── data/                 # Repositories, Models
│── logic/                # State Management (Cubits)
│── presentation/         # UI Screens, Components
│── routes/               # GoRouter Navigation Setup
│── dependency_injection/ # GetIt Service Locator
```

### Optimizations
- Lazy initialization for efficient memory management.
- Scoped state handling to minimize unnecessary rebuilds.
- Optimized routing with smooth UI transitions.
- Clean and maintainable code structure.
- Centralized dialog management.
- Reusable UI components and layouts.
- Scalable API handling structure.

