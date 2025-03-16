import 'package:baridx_orderflow/provider/bloc_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_injection/service_locator.dart';
import 'app.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent, // Make it transparent or any color
  //     statusBarIconBrightness: Brightness.dark, // Dark icons for light backgrounds
  //     statusBarBrightness: Brightness.light, // Light status bar for iOS
  //   ),
  // );
  setupLocator();
  runApp(
    MultiBlocProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}
