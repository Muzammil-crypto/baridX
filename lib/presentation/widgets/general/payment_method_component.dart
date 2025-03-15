import 'package:flutter/material.dart';

class PaymentMethodsComponent extends StatelessWidget {
  final List<String> paymentMethods;
  final String selectedMethod;
  final ValueChanged<String> onSelectMethod;

  const PaymentMethodsComponent({
    Key? key,
    required this.paymentMethods,
    required this.selectedMethod,
    required this.onSelectMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: paymentMethods.map((method) {
        return RadioListTile<String>(
          title: Text(method),
          value: method,
          groupValue: selectedMethod,
          onChanged: (value) => onSelectMethod(value!),
        );
      }).toList(),
    );
  }
}
