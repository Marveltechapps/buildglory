import 'api_error.dart';

/// Generic API Response wrapper
class ApiResponse<T> {
  final T? data;
  final ApiError? error;
  final bool isSuccess;

  ApiResponse._({
    this.data,
    this.error,
    required this.isSuccess,
  });

  /// Create a successful response
  factory ApiResponse.success(T? data) {
    return ApiResponse._(
      data: data,
      isSuccess: true,
    );
  }

  /// Create an error response
  factory ApiResponse.error(ApiError error) {
    return ApiResponse._(
      error: error,
      isSuccess: false,
    );
  }

  /// Check if response has data
  bool get hasData => data != null;

  /// Get data or throw error
  T get dataOrThrow {
    if (isSuccess && data != null) {
      return data as T;
    }
    throw error ?? ApiError(message: 'Unknown error', statusCode: 0);
  }

  /// Map the data to another type
  ApiResponse<R> map<R>(R Function(T) transform) {
    if (isSuccess && data != null) {
      return ApiResponse.success(transform(data as T));
    }
    return ApiResponse.error(error!);
  }

  /// Handle the response with callbacks
  R when<R>({
    required R Function(T data) success,
    required R Function(ApiError error) failure,
  }) {
    if (isSuccess && data != null) {
      return success(data as T);
    }
    return failure(error!);
  }
}

