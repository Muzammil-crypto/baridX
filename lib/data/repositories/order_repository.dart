import 'package:baridx_orderflow/core/network/endpoints.dart';
import 'package:flutter/widgets.dart';
import '../../core/network/api_client.dart';

/// Repository responsible for handling order-related API calls.
class OrderRepository {
  final ApiClient apiClient;

  /// Constructor requires an instance of `ApiClient` to perform API operations.
  OrderRepository({required this.apiClient});

  /// Submits an order by making a POST request.
  /// Returns `true` if successful, `false` if an error occurs.
  Future<bool> submitOrder() async {
    try {
      debugPrint('Submitting Order');
      await apiClient.post(Endpoints.submitOrder, body: {});
      return true; // Order submission successful
    } catch (e) {
      return false; // Handle failure gracefully
    }
  }
}
