import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart'; // Import Sizer for responsive scaling.

/// AppFonts class contains all the font families, sizes, and weights used in the app.
class AppFonts {
  // Font Families
  static const String primaryFont = "Roboto";
  static const String secondaryFont = "Montserrat";

  // Font Sizes (Using Sizer for Responsive Scaling)
  static double get heading1 => 24.sp; // Largest heading
  static double get heading2 => 22.sp; // Section headings
  static double get heading3 => 18.sp; // Sub-headings
  static double get body => 16.sp;     // Standard body text
  static double get small => 14.sp;    // Secondary text, captions
  static double get extraSmall => 12.sp; // Sub-caption text
  static double get xxSmall => 10.sp;    // Smallest text (labels, minor details)

  // Font Weights
  static const FontWeight bold = FontWeight.bold;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.normal;
}
