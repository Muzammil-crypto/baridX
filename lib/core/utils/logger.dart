import 'package:flutter/foundation.dart';

class Logger {
  /// Log a debug message
  static void debug(String message) {
    if (kDebugMode) {
      print("DEBUG: $message");
    }
  }

  /// Log an info message
  static void info(String message) {
    if (kDebugMode) {
      print("INFO: $message");
    }
  }

  /// Log an error message
  static void error(String message, [Object? error]) {
    if (kDebugMode) {
      print("ERROR: $message");
      if (error != null) {
        print("Exception: $error");
      }
    }
  }
}
