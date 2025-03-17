import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldCubit extends Cubit<void> {
  final AnimationController controller;
  late Animation<double> shakeAnimation;

  TextFieldCubit({required this.controller}) : super(null) {
    // Ensure duration is set when initializing the controller
    controller.duration = const Duration(milliseconds: 400);

    // Define shake animation using TweenSequence
    shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10, end: 10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10, end: -10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10, end: 10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10, end: 0), weight: 1),
    ]).animate(controller);
  }

  // Function to trigger shake animation
  void shake() {
    controller.forward(from: 0);
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
