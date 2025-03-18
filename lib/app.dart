import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'core/constants/app_strings.dart';
import 'routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      /// `Sizer` is used to make the app responsive across different screen sizes.
      /// It provides percentage-based width and height calculations, improving UI consistency.
      builder: (_, __, ___) => MaterialApp.router(
        /// Hides the debug banner based on the app's configuration.
        debugShowCheckedModeBanner: AppStrings.debugShowCheckedModeBanner,

        /// Sets the application title dynamically from constants.
        title: AppStrings.appName,

        /// Configures the navigation using GoRouter.
        /// This centralizes routing logic, making navigation management more maintainable.
        routerConfig: AppRouter.router,
      ),
    );
  }
}
