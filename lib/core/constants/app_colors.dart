import 'package:flutter/material.dart';

class AppColors {
  /// Primary Brand Colors (Soft Purple Theme)
  static const Color primary = Color(0xFF7E57C2); // Soft Purple
  static const Color secondary = Color(0xFFB39DDB); // Lighter Purple
  static const Color accent =
      Color(0xFFFFC107); // Gold Accent (used for highlights)

  /// Background Colors
  static const Color backgroundLight =
      Color(0xFFF8F9FA); // Light Grey Background
  static const Color backgroundDark = Color(0xFF212121); // Dark Mode Background

  /// Gradient Colors
  static const Color gradientStart = Color(0xFFEDE7F6);
  static const Color gradientMid = Color(0xFFF5F3FF);
  static const Color gradientEnd = Colors.white;

  /// Text Colors
  static const Color textPrimary = Colors.black; // Primary text color
  static const Color textSecondary = Colors.black54; // Secondary text color
  static const Color textLight =
      Colors.white; // Light text for dark backgrounds
  static const Color textButton = Colors.white; // Button text color

  /// Button & UI Colors
  static const Color buttonPrimary = Color(0xFF7E57C2); // Matches primary color
  static const Color buttonSecondary = Color(0xFFB39DDB); // Lighter variant
  static const Color buttonHover =
      Color(0xFF6A1B9A); // Darker purple hover effect

/// Blurred Light Effects (Slightly Lighter Variants)
  static const Color blurLightPurple = Color(0xFF9575CD); // Softer Purple
  static const Color blurSoftPurple = Color(0xFFD1C4E9); // Even lighter Purple

  /// Error, Success, and Warning Colors
  static const Color error = Color(0xFFD32F2F); // Red for errors
  static const Color success = Color(0xFF28A745); // Green for success messages
  static const Color warning = Color(0xFFFFC107); // Yellow for warnings

  /// Divider Color
  static const Color divider = Color(0xFFE0E0E0);

  /// Dots Indicator Colors
  static const Color inactiveDot = Colors.grey;
  static const Color activeDot = Color(0xFF7E57C2); // Matches primary color

  /// View Gradient
  static const LinearGradient appGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      gradientStart,
      gradientMid,
      gradientEnd,
    ],
  );
}
