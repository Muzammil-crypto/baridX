import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:baridx_orderflow/routes/app_router.dart';

class IntroCubit extends Cubit<void> {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  IntroCubit({required BuildContext context, required TickerProvider vsync})
      : super(null) {
    // Initializes the animation controller with a duration of 1.2 seconds.
    // TickerProvider (vsync) is required to optimize animations and prevent unnecessary resource usage.
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: vsync,
    );

    // Defines a fade-in animation from 0 (fully transparent) to 1 (fully visible).
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    // Defines a slide-up animation starting from 20% below its original position to normal.
    slideAnimation = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    // Starts the animation sequence immediately.
    animationController.forward();

    // Navigates to the Splash screen after 3 seconds.
    // This creates an automatic transition after the intro animation completes.
    Future.delayed(const Duration(seconds: 3), () {
      AppRouter.goSplash();
    });
  }

  @override
  Future<void> close() {
    // Disposes of the animation controller to free up resources when the Cubit is closed.
    animationController.dispose();
    return super.close();
  }
}
