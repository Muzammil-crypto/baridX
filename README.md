# BaridX Flutter App

## 📌 Overview

A **multi-step order creation app** built with **Cubit (Bloc) for state management**, **GoRouter for navigation**, and **GetIt for Dependency Injection**. Designed with **clean architecture** for scalability and maintainability.

## 🚀 Key Decisions

### **1️⃣ Why Cubit?**

- **Lightweight & Simple** – Less boilerplate than Bloc.
- **Separation of Concerns** – Business logic stays independent from UI.
- **Scalability** – Manages multi-step state efficiently.

### **2️⃣ Why Avoid MultiBlocProvider in Root?**

- **Prevents Bloated Widget Tree** – Avoids unnecessary state updates.
- **Scoped State Management** –

```dart
locator.registerLazySingleton(() => CustomerInfoCubit());
locator.registerFactory(() => OrderCubit(locator<OrderRepository>()));
```

### **3️⃣ Why GetIt for Dependency Injection?**

- **Global Access** – No manual prop drilling.
- **Lazy Initialization** – Optimized memory use.
- **Loose Coupling** – Easy to swap implementations.

```dart
final paymentCubit = locator<PaymentCubit>();
```

### **4️⃣ Why GoRouter?**

- **Declarative & Flexible Routing**
- **Custom Transitions for Smooth UI**

```dart
static void goPayment() => locator<GoRouter>().push(paymentRoute);
```

## 📌 Additional Enhancements

### **🔹 Global DialogService**

- Implemented a **DialogService** to show dialogs globally **without requiring context**.
- **Why?** Passing context deep into functions can cause **memory leaks and unnecessary dependencies**.

### **🔹 Complete API Flow Instead of Future.delayed()**

- Instead of using a simple `Future.delayed()`, implemented a **proper API request flow** for better **scalability and real-world readiness**.
- **Ensures cleaner separation** of business logic and API calls.

### **🔹 Modularized Code**

- **Separated UI styles, texts, strings, and dimensions** into dedicated files.
- **Divided complex screens into small reusable widgets** for better maintainability.

### **🔹 General AppLayout for Reusability**

- Created a **universal AppLayout** to wrap screens and handle **common UI elements** like AppBar, BackButton, etc.
- **Saves time and increases design consistency** across the app.

### **🔹 Validators & Form Handling**

- Used **custom validators and loggers** for input validation.
- **Implemented Form for better user input handling**.

### **🔹 UI Enhancements**

- **IntroScreen & Splash Screen** with three onboarding slides.
- **HomeScreen** with basic details and navigation options.

### **🔹 Generic Animation Function**

- Created a **reusable function** to handle **animated screen transitions** throughout the app.

### **🔹 Centralized Logic in Cubits**

- All business logic is **contained within Cubits** and accessed via **GetIt locator** for better structure and **testability**.

## 📂 Folder Structure

```
lib/
│── core/                 # Constants, Utilities, API Configurations
│── data/                 # Repositories, Models
│── domain/               # Business Logic (Use Cases)
│── logic/                # State Management (Cubits)
│── presentation/         # UI Screens, Components
│── routes/               # GoRouter Navigation Setup
│── dependency_injection/ # GetIt Service Locator
```

## 📌 Optimizations

✅ **Lazy Initialization**\
✅ **Scoped State Handling**\
✅ **Optimized Routing & UI Transitions**\
✅ **Clean & Maintainable Code**\
✅ **Global Dialog Management**\
✅ **Reusable UI Components & Layout**\
✅ **Structured API Handling for Scalability**

## 🔹 Final Thoughts

Built with **best practices**, ensuring a **modular, scalable, and testable architecture**. 🚀

