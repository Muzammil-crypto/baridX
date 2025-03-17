import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'core/constants/app_strings.dart';
import 'core/services/dialog_service.dart';
import 'dependency_injection/service_locator.dart';
import 'routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __, ___) => MaterialApp.router(
        debugShowCheckedModeBanner: AppStrings.debugShowCheckedModeBanner,
        title: AppStrings.appName,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
