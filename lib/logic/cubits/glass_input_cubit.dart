import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Manages the shake animation for text fields when validation fails.
class TextFieldCubit extends Cubit<void> {
  final AnimationController controller;
  late Animation<double> shakeAnimation;

  /// Initializes the animation controller and defines the shake effect.
  TextFieldCubit({required this.controller}) : super(null) {
    // Ensure duration is set when initializing the controller
    controller.duration = const Duration(milliseconds: 400);

    /// Define shake animation using TweenSequence for smooth oscillation effect
    shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10, end: 10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10, end: -10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10, end: 10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10, end: 0), weight: 1),
    ]).animate(controller);
  }

  /// Triggers the shake animation when input validation fails.
  void shake() {
    controller.forward(from: 0);
  }

  @override
  Future<void> close() {
    controller.dispose(); // Dispose of the animation controller to free memory.
    return super.close();
  }
}
