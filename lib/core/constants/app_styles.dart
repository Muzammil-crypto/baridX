import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppStyles {
  // Headings
  static TextStyle get heading1 => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.heading1,
        fontWeight: AppFonts.bold,
        color: AppColors.textPrimary,
      );

  static TextStyle get heading2 => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.heading2,
        fontWeight: AppFonts.medium,
        color: AppColors.textPrimary,
      );

  // Body Text
  static TextStyle get bodyText => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.body,
        fontWeight: AppFonts.regular,
        color: AppColors.textSecondary,
      );

  // Button Text
  static TextStyle get buttonText => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.body,
        fontWeight: AppFonts.bold,
        color: AppColors.textLight,
      );

  static TextStyle get smallText => TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.small,
        fontWeight: AppFonts.regular,
        color: AppColors.textSecondary,
      );

  // Custom Text Styles
  static TextStyle get titleStyle => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      );

  static TextStyle get subtitleStyle => TextStyle(
        fontSize: 14.sp,
        color: AppColors.textSecondary,
      );

  static TextStyle get buttonTextStyle => TextStyle(
        fontSize: 15.sp,
        color: AppColors.textSecondary,
      );

  // Dot Indicator Styles
  static BoxDecoration get activeDotStyle => const BoxDecoration(
        color: AppColors.activeDot,
        shape: BoxShape.circle,
      );

  static BoxDecoration get inactiveDotStyle => const BoxDecoration(
        color: AppColors.inactiveDot,
        shape: BoxShape.circle,
      );

  // Input Field Text Style
  static TextStyle get inputTextStyle => TextStyle(
        fontSize: 14.sp,
        color: AppColors.textPrimary,
      );

  // Input Field Hint Style
  static TextStyle get inputHintStyle => TextStyle(
        fontSize: 15.sp,
        color: AppColors.textSecondary.withOpacity(0.7),
      );
  // errorTextStyle
  static TextStyle get errorTextStyle => TextStyle(
        fontSize: 14.sp,
        color: AppColors.error,
      );

  // App Bar Title Style
  static TextStyle get appBarTitleStyle => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      );
}
