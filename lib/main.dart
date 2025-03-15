import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'core/constants/app_strings.dart';
import 'routes/app_router.dart';
import 'themes/light_theme.dart';
import 'themes/dark_theme.dart';
import 'dependency_injection/service_locator.dart';
import 'logic/cubits/user_cubit.dart';
import 'app.dart';

void main() {
  // Initialize dependencies
  setupLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => locator<OrderCubit>()),
        BlocProvider(create: (_) => locator<UserCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}
