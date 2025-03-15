import 'package:baridx_orderflow/presentation/widgets/base/custom_button.dart';
import 'package:baridx_orderflow/presentation/widgets/general/payment_method_component.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedMethod = "Credit Card";

  void _nextStep() {
    GoRouter.of(context).push('/review-submit');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.paymentMethod)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PaymentMethodsComponent(
              paymentMethods: ["Credit Card", "Cash on Delivery", "Pay Later"],
              selectedMethod: selectedMethod,
              onSelectMethod: (method) {
                setState(() {
                  selectedMethod = method;
                });
              },
            ),
            const SizedBox(height: 20),
            CustomButton(text: "Next", onPressed: _nextStep),
          ],
        ),
      ),
    );
  }
}
