import 'package:bloc/bloc.dart';

class AnimatedButtonCubit extends Cubit<bool> {
  AnimatedButtonCubit() : super(false);
  void animate() {
    emit(true);
    Future.delayed(const Duration(milliseconds: 300), () => emit(false));
  }
}
