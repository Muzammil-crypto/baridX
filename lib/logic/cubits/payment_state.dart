part of 'payment_cubit.dart';

abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentMethodSelected extends PaymentState {
  final String paymentMethod;
  PaymentMethodSelected(this.paymentMethod);
}
