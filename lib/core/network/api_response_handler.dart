import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'api_exceptions.dart';

/// Handles API responses and throws appropriate exceptions based on status codes.
class ApiResponseHandler {
  static dynamic handleResponse(response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body); // Success response
      case 400:
        throw BadRequestException(jsonDecode(response.body)['message'] ?? "Bad request.");
      case 401:
      case 403:
        throw UnauthorizedException(jsonDecode(response.body)['message'] ?? "Unauthorized access.");
      case 404:
        throw NotFoundException(jsonDecode(response.body)['message'] ?? "Not found.");
      case 500:
      case 502:
      case 503:
        throw ServerException("Server error occurred.");
      default:
        throw ApiException("Unexpected error: ${response.statusCode}");
    }
  }
}
