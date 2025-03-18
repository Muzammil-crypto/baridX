import 'package:flutter/material.dart';
import 'dependency_injection/service_locator.dart';
import 'app.dart';

void main() {
  /// Registers all dependencies before the app starts.
  /// This ensures that services and Cubits are available throughout the app
  /// without needing to manually pass them around.
  setupLocator();

  /// Runs the main application.
  /// Using `const` helps optimize performance by reducing unnecessary rebuilds.
  runApp(const MyApp());
}
