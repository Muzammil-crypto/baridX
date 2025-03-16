import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'core/constants/app_strings.dart';
import 'routes/app_router.dart';
import 'themes/light_theme.dart';
import 'themes/dark_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // The parameters orientation and deviceType are unused in Sizer, so replaced them with _ (ignored variables).
    return Sizer(
      builder: (_, __, ___) => MaterialApp.router(
        debugShowCheckedModeBanner: AppStrings.debugShowCheckedModeBanner,
        title: AppStrings.appName,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system, // Uses system light/dark mode
        routerConfig: AppRouter.router, // GoRouter Configuration
      ),
    );
  }
}
