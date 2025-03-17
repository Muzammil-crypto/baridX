import 'package:baridx_orderflow/themes/typography.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';


final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  textTheme: TypographyStyles.textTheme,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    titleTextStyle: TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.buttonPrimary,
    textTheme: ButtonTextTheme.primary,
  ),
);

