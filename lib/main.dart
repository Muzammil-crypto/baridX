import 'package:flutter/material.dart';
import 'dependency_injection/service_locator.dart';
import 'app.dart';

void main() {
  /// Register all the models and services before the app starts
  setupLocator();
  runApp(const MyApp());
}