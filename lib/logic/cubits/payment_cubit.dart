import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_enums.dart';
import '../../routes/app_router.dart';
import 'package:equatable/equatable.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final payLaterKey = GlobalKey<FormState>();
  final payViaCardKey = GlobalKey<FormState>();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  PaymentCubit() : super(const PaymentState());

  void selectPaymentMethod(PaymentMethod method) {
    emit(state.copyWith(selectedMethod: method));
  }

  void updateCardNumber(String number) {
    emit(state.copyWith(cardNumber: number));
  }

  void updatePhoneNumber(String number) {
    emit(state.copyWith(phoneNumber: number));
  }

  void handleOnPressed() {
    switch (state.selectedMethod) {
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
    }
  }
}


class PaymentState extends Equatable {
  final PaymentMethod selectedMethod;
  final String cardNumber;
  final String phoneNumber;

  const PaymentState({
    this.selectedMethod = PaymentMethod.creditCard,
    this.cardNumber = "",
    this.phoneNumber = "",
  });

  PaymentState copyWith({
    PaymentMethod? selectedMethod,
    String? cardNumber,
    String? phoneNumber,
  }) {
    return PaymentState(
      selectedMethod: selectedMethod ?? this.selectedMethod,
      cardNumber: cardNumber ?? this.cardNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object> get props => [selectedMethod, cardNumber, phoneNumber];
}
