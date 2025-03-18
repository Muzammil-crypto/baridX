import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import '../../routes/app_router.dart';

/// Manages splash screen animations and navigation logic.
class SplashCubit extends Cubit<int> {

  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  /// Initializes animations and starts them immediately.
  SplashCubit({required TickerProvider vsync}) : super(0) {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 600), // Smooth fade-in effect
      vsync: vsync,
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    slideAnimation = Tween<Offset>(begin: const Offset(0.0, 0.4), end: Offset.zero).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    startAnimation(); // Auto-start animation on app launch
  }

  /// Updates the current slide page index and restarts animations.
  void updatePage(int pageIndex) {
    emit(pageIndex); // Notify UI of page change
    startAnimation(); // Restart animation on new slide
  }

  /// Restarts animation from the beginning.
  void startAnimation() {
    animationController.forward(from: 0.0);
  }

  /// Handles skip button press, navigates to the Home screen.
  void onPressed() {
    AppRouter.goHome();
  }

  @override
  Future<void> close() {
    animationController.dispose(); // Dispose animation controller to free memory
    return super.close();
  }
}
