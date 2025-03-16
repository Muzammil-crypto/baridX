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
    // Initialize animation controller
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: vsync,
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    slideAnimation = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    // Start animation and auto-transition after 3 seconds
    animationController.forward();
    Future.delayed(const Duration(seconds: 3), () {
      AppRouter.goSplash();
    });
  }

  @override
  Future<void> close() {
    animationController.dispose();
    return super.close();
  }
}
