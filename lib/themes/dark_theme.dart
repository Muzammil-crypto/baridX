import 'package:baridx_orderflow/themes/typography.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  textTheme: TypographyStyles.textTheme,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundDark,
    titleTextStyle: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.backgroundLight),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.buttonPrimary,
    textTheme: ButtonTextTheme.primary,
  ),
);
