import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

/// Defines a centralized collection of text styles, UI styles, and decorations
/// to ensure consistent typography and visual design across the app.
class AppStyles {
  // ========================
  // Headings
  // ========================

  /// Primary heading (largest) used for section titles.
  static TextStyle get heading1 => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.heading1,
        fontWeight: AppFonts.bold,
        color: AppColors.textPrimary,
      );

  /// Secondary heading, slightly smaller than `heading1`.
  static TextStyle get heading2 => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.heading2,
        fontWeight: AppFonts.medium,
        color: AppColors.textPrimary,
      );

  // ========================
  // Body Text
  // ========================

  /// Standard body text used for content.
  static TextStyle get bodyText => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.body,
        fontWeight: AppFonts.regular,
        color: AppColors.textSecondary,
      );

  /// Small-sized text, used for captions and less prominent content.
  static TextStyle get smallText => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.small,
        fontWeight: AppFonts.regular,
        color: AppColors.textSecondary,
      );

  // ========================
  // Button Text
  // ========================

  /// General button text style.
  static TextStyle get buttonText => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.body,
        fontWeight: AppFonts.bold,
        color: AppColors.textLight,
      );

  /// Button text style for navigation buttons.
  static TextStyle get nextButtonTextStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.body,
        fontWeight: AppFonts.bold,
        color: AppColors.textLight,
      );

  static TextStyle get buttonTextStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.body,
        color: AppColors.textPrimary,
      );

  // ========================
  // Titles & Subtitles
  // ========================

  /// Default title text style.
  static TextStyle get titleStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.heading2,
        fontWeight: AppFonts.bold,
        color: AppColors.textPrimary,
      );

  /// Subtitle text style for supporting text.
  static TextStyle get subtitleStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.small,
        color: AppColors.textSecondary,
      );

  /// Title style for package details sections.
  static TextStyle get packageDetailsTitleStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.heading2,
        fontWeight: AppFonts.bold,
        color: AppColors.textPrimary,
      );

  /// Subtitle style for package details.
  static TextStyle get packageDetailsSubtitleStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.small,
        color: AppColors.textSecondary,
      );

  // ========================
  // Input Fields & Forms
  // ========================

  /// Style for form labels.
  static TextStyle get formLabelStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.small,
        fontWeight: AppFonts.medium,
        color: AppColors.textPrimary,
      );

  /// Style for input field text.
  static TextStyle get inputTextStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.small,
        color: AppColors.textPrimary,
      );

  /// Style for input field hints.
  static TextStyle get inputHintStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.small,
        color: AppColors.textSecondary.withOpacity(0.7),
      );

  /// Style for error messages in form fields.
  static TextStyle get errorTextStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.small,
        color: AppColors.error,
      );

  // ========================
  // UI Components
  // ========================

  /// App bar title style.
  static TextStyle get appBarTitleStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.heading3,
        fontWeight: AppFonts.bold,
        color: AppColors.textPrimary,
      );

  /// Header title style used in sections like onboarding.
  static TextStyle get headerTitleStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.heading2,
        fontWeight: AppFonts.bold,
        color: AppColors.textPrimary,
      );

  /// Header subtitle style used in sections like onboarding.
  static TextStyle get headerSubtitleStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.small,
        color: AppColors.textSecondary,
      );

  /// Label text style for form fields.
  static TextStyle get labelTextStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.small,
        fontWeight: AppFonts.medium,
        color: AppColors.textPrimary,
      );

  // ========================
  // Indicators & Decorations
  // ========================

  /// Active dot style used for onboarding indicators.
  static BoxDecoration get activeDotStyle => const BoxDecoration(
        color: AppColors.activeDot,
        shape: BoxShape.circle,
      );

  /// Inactive dot style used for onboarding indicators.
  static BoxDecoration get inactiveDotStyle => const BoxDecoration(
        color: AppColors.inactiveDot,
        shape: BoxShape.circle,
      );

  /// Text style for payment method selection buttons.
  static TextStyle paymentMethodTextStyle(bool isSelected) => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.extraSmall,
        color: isSelected ? AppColors.backgroundLight : AppColors.textPrimary,
        fontWeight: AppFonts.medium,
      );

  // ========================
  // Order Summary Styles
  // ========================

  /// Order detail section title style.
  static TextStyle get orderDetailTitleStyle => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.small,
        fontWeight: AppFonts.bold,
        color: AppColors.primary,
      );

  /// Order detail text style.
  static TextStyle get orderDetailTextStyle => TextStyle(
        fontSize: AppFonts.small,
      );
}
