/// API Error model
class ApiError {
  final String message;
  final int statusCode;
  final dynamic error;

  ApiError({
    required this.message,
    required this.statusCode,
    this.error,
  });

  bool get isNetworkError => statusCode == 0;
  bool get isUnauthorized => statusCode == 401;
  bool get isForbidden => statusCode == 403;
  bool get isNotFound => statusCode == 404;
  bool get isServerError => statusCode >= 500;

  @override
  String toString() {
    return 'ApiError(message: $message, statusCode: $statusCode)';
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'statusCode': statusCode,
      'error': error,
    };
  }
}

