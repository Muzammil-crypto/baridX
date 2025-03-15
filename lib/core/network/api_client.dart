import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_exceptions.dart';
import 'api_response_handler.dart';

class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  /// GET Request
  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'), headers: headers);
      return ApiResponseHandler.handleResponse(response);
    } catch (e) {
      throw ApiException('GET request failed: $e');
    }
  }

  /// POST Request
  Future<dynamic> post(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers ?? {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return ApiResponseHandler.handleResponse(response);
    } catch (e) {
      throw ApiException('POST request failed: $e');
    }
  }

  /// PUT Request
  Future<dynamic> put(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers ?? {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return ApiResponseHandler.handleResponse(response);
    } catch (e) {
      throw ApiException('PUT request failed: $e');
    }
  }

  /// DELETE Request
  Future<dynamic> delete(String endpoint, {Map<String, String>? headers}) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl$endpoint'), headers: headers);
      return ApiResponseHandler.handleResponse(response);
    } catch (e) {
      throw ApiException('DELETE request failed: $e');
    }
  }
}
