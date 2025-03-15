import 'package:baridx_orderflow/data/models/order_model.dart';
import 'package:baridx_orderflow/presentation/widgets/base/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';

class ReviewSubmitScreen extends StatelessWidget {
  const ReviewSubmitScreen({Key? key}) : super(key: key);

  void _submitOrder(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Order Successfully Submitted!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Placeholder order data
    final order = OrderModel(
      id: "123",
      customerName: "John Doe",
      customerPhone: "1234567890",
      customerAddress: "123 Street, City",
      packageType: "Medium",
      weight: 5.0,
      deliveryNotes: "Handle with care",
      paymentMethod: "Credit Card",
      status: "Pending",
    );

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.reviewOrder)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // OrderSummaryComponent(order: order),
            const SizedBox(height: 20),
            CustomButton(text: "Submit Order", onPressed: () => _submitOrder(context)),
          ],
        ),
      ),
    );
  }
}
