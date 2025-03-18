/// Base exception class for handling API-related errors.
class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => "ApiException: $message";
}

/// Exception for HTTP 400 - Bad Request.
class BadRequestException extends ApiException {
  BadRequestException([String? message]) : super(message ?? "Bad request.");
}

/// Exception for HTTP 401/403 - Unauthorized access.
class UnauthorizedException extends ApiException {
  UnauthorizedException([String? message]) : super(message ?? "Unauthorized access.");
}

/// Exception for HTTP 404 - Resource Not Found.
class NotFoundException extends ApiException {
  NotFoundException([String? message]) : super(message ?? "Requested resource not found.");
}

/// Exception for HTTP 500+ - Server Errors.
class ServerException extends ApiException {
  ServerException([String? message]) : super(message ?? "Server error occurred.");
}

/// Exception for network timeouts.
class TimeoutException extends ApiException {
  TimeoutException([String? message]) : super(message ?? "Request timeout.");
}
