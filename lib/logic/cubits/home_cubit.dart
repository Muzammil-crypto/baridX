import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';

class HomeCubit extends Cubit<void> {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  /// Initializes animations when the HomeCubit is created.
  HomeCubit({required TickerProvider vsync}) : super(null) {
    _initializeAnimations(vsync);
  }

  /// Sets up fade-in and slide-up animations.
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

    // Starts animations when the HomeScreen loads.
    animationController.forward();
  }

  @override
  Future<void> close() {
    // Dispose of the animation controller when the Cubit is closed to prevent memory leaks.
    animationController.dispose();
    return super.close();
  }
}
