import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_enums.dart';
import '../../routes/app_router.dart';

class PaymentCubit extends Cubit<PaymentMethod> {
  /// Controllers and form key
  final payLaterKey = GlobalKey<FormState>();
  final payViaCardKey = GlobalKey<FormState>();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  PaymentCubit() : super(PaymentMethod.creditCard);

  void selectPaymentMethod(PaymentMethod method) {
    emit(method);
  }

  void handleOnPressed() {
    switch (state) {
      case PaymentMethod.creditCard:
        handlePayViaCard();
        break;
      case PaymentMethod.cashOnDelivery:
        handleCashOnDelivery();
        break;
      case PaymentMethod.payLater:
        handlePayLater();
        break;
    }
  }

  void handlePayLater() {
    if (payLaterKey.currentState!.validate()) {
      AppRouter.goReviewSubmit();
    }
  }

  void handlePayViaCard() {
    if (payViaCardKey.currentState!.validate()) {
      AppRouter.goReviewSubmit();
    }
  }

  void handleCashOnDelivery() {
    AppRouter.goReviewSubmit();
  }
}
