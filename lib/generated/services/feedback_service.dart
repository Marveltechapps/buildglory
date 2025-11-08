import '../core/api_client.dart';
import '../core/api_response.dart';
import '../models/feedback.dart';

/// Feedback service
class FeedbackService {
  final ApiClient _apiClient;

  FeedbackService(this._apiClient);

  /// Get all user feedback (requires authentication)
  Future<ApiResponse<List<Feedback>>> getUserFeedback() async {
    return await _apiClient.get(
      '/feedback',
      fromJson: (json) {
        final list = json as List;
        return list.map((item) => Feedback.fromJson(item as Map<String, dynamic>)).toList();
      },
    );
  }

  /// Submit feedback
  Future<ApiResponse<Feedback>> submitFeedback({
    required String fullName,
    required String email,
    required String subject,
    required String message,
  }) async {
    return await _apiClient.post(
      '/feedback',
      body: {
        'fullName': fullName,
        'email': email,
        'subject': subject,
        'message': message,
      },
      fromJson: (json) => Feedback.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Update feedback
  Future<ApiResponse<Feedback>> updateFeedback(String id, Feedback feedback) async {
    return await _apiClient.put(
      '/feedback/$id',
      body: feedback.toJson(),
      fromJson: (json) => Feedback.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Delete feedback
  Future<ApiResponse<Map<String, dynamic>>> deleteFeedback(String id) async {
    return await _apiClient.delete(
      '/feedback/$id',
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }
}

