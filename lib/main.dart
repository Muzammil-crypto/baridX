import 'package:baridx_orderflow/provider/bloc_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_injection/service_locator.dart';
import 'app.dart';

void main() {

  setupLocator();
  runApp(
    MultiBlocProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}
