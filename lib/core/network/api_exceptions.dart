class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => "ApiException: $message";
}

class BadRequestException extends ApiException {
  BadRequestException([String? message]) : super(message ?? "Bad request.");
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([String? message]) : super(message ?? "Unauthorized access.");
}

class NotFoundException extends ApiException {
  NotFoundException([String? message]) : super(message ?? "Requested resource not found.");
}

class ServerException extends ApiException {
  ServerException([String? message]) : super(message ?? "Server error occurred.");
}

class TimeoutException extends ApiException {
  TimeoutException([String? message]) : super(message ?? "Request timeout.");
}
