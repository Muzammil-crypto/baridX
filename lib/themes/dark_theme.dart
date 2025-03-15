import 'package:baridx_orderflow/themes/typography.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundDark,
    foregroundColor: Colors.white,
  ),
  textTheme: TypographyStyles.textTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent),
  ),
);
