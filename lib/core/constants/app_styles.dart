import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppStyles {
  // Headings
  static TextStyle get heading1 => const TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.heading1,
        fontWeight: AppFonts.bold,
        color: AppColors.textPrimary,
      );

  static TextStyle get heading2 => const TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.heading2,
        fontWeight: AppFonts.medium,
        color: AppColors.textPrimary,
      );

  // Body Text
  static TextStyle get bodyText => const TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.body,
        fontWeight: AppFonts.regular,
        color: AppColors.textSecondary,
      );

  // Button Text
  static TextStyle get buttonText => const TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: AppFonts.body,
        fontWeight: AppFonts.bold,
        color: AppColors.textLight,
      );

  static TextStyle get smallText => const TextStyle(
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
        color: AppColors.textPrimary,
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
  // App header title style
  static TextStyle get headerTitleStyle => TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      );
  // App header subtitle style
  static TextStyle get headerSubtitleStyle => TextStyle(
        fontSize: 14.sp,
        color: AppColors.textSecondary,
      );

  // Input hint styles
  static TextStyle get labelTextStyle => const TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

// Package Details Header
  static TextStyle get packageDetailsTitleStyle => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      );

  static TextStyle get packageDetailsSubtitleStyle => TextStyle(
        fontSize: 14.sp,
        color: AppColors.textSecondary,
      );

// Form Labels
  static TextStyle get formLabelStyle => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

// Input Field Hint Text
  static TextStyle get inputHintTextStyle => TextStyle(
        fontSize: 14.sp,
        color: AppColors.textSecondary.withOpacity(0.7),
      );

// Button Text
  static TextStyle get nextButtonTextStyle => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textLight,
      );

  // Payment Method Button Text Style
  static TextStyle paymentMethodTextStyle(bool isSelected) => TextStyle(
        color: isSelected ? AppColors.backgroundLight : AppColors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 13.sp,
      );

// Order Detail Section Title Style
  static TextStyle get orderDetailTitleStyle => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      );

// Order Detail Section Text Style
  static TextStyle get orderDetailTextStyle => TextStyle(
        fontSize: 13.sp,
        color: AppColors.textPrimary,
      );
}
