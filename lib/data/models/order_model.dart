import 'dart:convert';

class OrderModel {
  final String id;
  final String customerName;
  final String customerPhone;
  final String customerAddress;
  final String packageType;
  final double weight;
  final String deliveryNotes;
  final String paymentMethod;
  final String status;

  OrderModel({
    required this.id,
    required this.customerName,
    required this.customerPhone,
    required this.customerAddress,
    required this.packageType,
    required this.weight,
    required this.deliveryNotes,
    required this.paymentMethod,
    required this.status,
  });

  /// Convert JSON to OrderModel
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? '',
      customerName: json['customer_name'] ?? '',
      customerPhone: json['customer_phone'] ?? '',
      customerAddress: json['customer_address'] ?? '',
      packageType: json['package_type'] ?? '',
      weight: (json['weight'] ?? 0).toDouble(),
      deliveryNotes: json['delivery_notes'] ?? '',
      paymentMethod: json['payment_method'] ?? '',
      status: json['status'] ?? '',
    );
  }

  /// Convert OrderModel to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "customer_name": customerName,
      "customer_phone": customerPhone,
      "customer_address": customerAddress,
      "package_type": packageType,
      "weight": weight,
      "delivery_notes": deliveryNotes,
      "payment_method": paymentMethod,
      "status": status,
    };
  }

  /// Convert JSON String to OrderModel
  static OrderModel fromJsonString(String jsonString) {
    return OrderModel.fromJson(jsonDecode(jsonString));
  }

  /// Convert OrderModel to JSON String
  String toJsonString() {
    return jsonEncode(toJson());
  }
}
