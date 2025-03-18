import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

/// AppDimensions class contains all the dimension constants used in the app.
class AppDimensions {
  /// Padding & Margin (Responsive)
  static double paddingSmall = 2.w;
  static double paddingMedium = 4.w;
  static double paddingLarge = 6.w;
  static double paddingMediumLarge = 8.w;
  static double paddingExtraLarge = 10.w;

  /// Border Radius (Responsive)
  static double borderRadiusSmall = 2.w;
  static double borderRadiusMedium = 3.w;
  static double borderRadiusLarge = 5.w;

  /// Button Sizes (Responsive)
  static double buttonHeight = 6.h;
  static double buttonWidth = 100.w;

  /// Icon Sizes (Responsive)
  static double iconSmall = 5.w;
  static double iconMedium = 7.w;
  static double iconLarge = 30.w;

  /// Blur Circle Sizes (Responsive)
  static double blurCircleSmall = 20.w;
  static double blurCircleMedium = 35.w;
  static double blurCircleLarge = 45.w;

  /// Responsive Helper Functions
  static double getScreenWidth(BuildContext context) => 100.w;
  static double getScreenHeight(BuildContext context) => 100.h;
}
