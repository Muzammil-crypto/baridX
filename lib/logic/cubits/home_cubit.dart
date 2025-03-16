import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';

class HomeCubit extends Cubit<void> {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  HomeCubit({required TickerProvider vsync}) : super(null) {
    _initializeAnimations(vsync);
  }

  void _initializeAnimations(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    slideAnimation = Tween<Offset>(begin: const Offset(0.0, 0.4), end: Offset.zero).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    animationController.forward(); // Start animations on screen load
  }

  @override
  Future<void> close() {
    animationController.dispose();
    return super.close();
  }
}
