import 'package:flutter/cupertino.dart';
import '../../core/constants/app_enums.dart';
import '../../routes/app_router.dart';

class PaymentCubit {
  /// Form Keys & Controllers
  final payLaterKey = GlobalKey<FormState>();
  final payViaCardKey = GlobalKey<FormState>();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  /// Selected Payment Method
  final ValueNotifier<PaymentMethod> selectedMethod =
  ValueNotifier(PaymentMethod.creditCard);

  /// Notify UI to rebuild
  void selectPaymentMethod(PaymentMethod method) {
    selectedMethod.value = method; // UI will update via ValueListenableBuilder
  }
  /// Handle the onPressed event
  void handleOnPressed() {
    switch (selectedMethod.value) {
      case PaymentMethod.creditCard:
        if (payViaCardKey.currentState!.validate()) {
          AppRouter.goReviewSubmit();
        }
        break;
      case PaymentMethod.cashOnDelivery:
        AppRouter.goReviewSubmit();
        break;
      case PaymentMethod.payLater:
        if (payLaterKey.currentState!.validate()) {
          AppRouter.goReviewSubmit();
        }
        break;
      case PaymentMethod.goBack:
    }
  }
}
