import 'dart:async';
import 'api_exceptions.dart';

/// A simple API client for handling HTTP requests.
class ApiClient {
  final String baseUrl;

  /// Constructor requires a `baseUrl` for making API requests.
  ApiClient({required this.baseUrl});

  /// Simulates a POST request with a delay to mimic real API behavior.
  Future<dynamic> post(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    try {
      await Future.delayed(const Duration(seconds: 2)); // Simulating network delay
      return {"status": "success", "message": "Order Submitted!"}; // Mock response
    } catch (e) {
      throw ApiException("API Call Failed: $e"); // Handle API failures
    }
  }
}
