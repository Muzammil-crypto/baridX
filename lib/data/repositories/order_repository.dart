import 'package:baridx_orderflow/core/network/endpoints.dart';
import 'package:flutter/widgets.dart';
import '../../core/network/api_client.dart';

class OrderRepository {
  final ApiClient apiClient;
  OrderRepository({required this.apiClient});

  Future<bool> submitOrder() async {
    try {
      debugPrint('Submitting Order');
      await apiClient.post(Endpoints.submitOrder, body: {});
      return true;
    } catch (e) {
      return false;
    }
  }
}
