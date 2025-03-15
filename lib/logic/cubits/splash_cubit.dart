import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';

class SplashCubit extends Cubit<int> {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  SplashCubit({required TickerProvider vsync}) : super(0) {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: vsync,
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.2), end: Offset.zero).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );
    // Play animation on app start
    startAnimation();
  }

  void updatePage(int pageIndex) {
    // Emit new page index
    emit(pageIndex);
    // Restart animation on new slide
    startAnimation();
  }

  void startAnimation() {
    animationController.forward(from: 0.0);
  }

  @override
  Future<void> close() {
    animationController.dispose();
    return super.close();
  }
}
