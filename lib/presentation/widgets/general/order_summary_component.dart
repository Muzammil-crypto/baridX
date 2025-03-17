import 'package:flutter/material.dart';

import '../../../data/models/order_model.dart';

class OrderSummaryComponent extends StatelessWidget {
  final OrderModel order;

  const OrderSummaryComponent({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Customer Name: ${order.customerName}", style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("Phone: ${order.customerPhone}"),
            Text("Address: ${order.customerAddress}"),
            const Divider(),
            Text("Package Type: ${order.packageType}"),
            Text("Weight: ${order.weight} kg"),
            Text("Delivery Notes: ${order.deliveryNotes}"),
            const Divider(),
            Text("Payment Method: ${order.paymentMethod}", style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
