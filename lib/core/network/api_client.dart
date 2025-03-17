import 'dart:async';
import 'api_exceptions.dart';

class ApiClient {
  final String baseUrl;
  ApiClient({required this.baseUrl});

  Future<dynamic> post(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulate API Call
      return {"status": "success", "message": "Order Submitted!"};
    } catch (e) {
      throw ApiException("API Call Failed: $e");
    }
  }
}
