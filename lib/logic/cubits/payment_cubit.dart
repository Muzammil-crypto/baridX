import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  /// Select Payment Method
  void selectPaymentMethod(String method) {
    emit(PaymentMethodSelected(method));
  }
}
