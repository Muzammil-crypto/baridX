import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'routes/app_router.dart';
import 'themes/light_theme.dart';
import 'themes/dark_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'BaridX OrderFlow',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system, // Uses system light/dark mode
          routerConfig: AppRouter.router, // GoRouter Configuration
        );
      },
    );
  }
}
