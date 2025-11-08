import '../core/api_client.dart';
import '../core/api_response.dart';
import '../models/notification.dart';

/// Notification service
class NotificationService {
  final ApiClient _apiClient;

  NotificationService(this._apiClient);

  /// Get all user notifications (requires authentication)
  Future<ApiResponse<List<AppNotification>>> getUserNotifications() async {
    return await _apiClient.get(
      '/notifications',
      fromJson: (json) {
        final list = json as List;
        return list.map((item) => AppNotification.fromJson(item as Map<String, dynamic>)).toList();
      },
    );
  }

  /// Create notification
  Future<ApiResponse<AppNotification>> createNotification(AppNotification notification) async {
    return await _apiClient.post(
      '/notifications',
      body: notification.toJson(),
      fromJson: (json) => AppNotification.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Mark notification as read
  Future<ApiResponse<Map<String, dynamic>>> markAsRead(String id) async {
    return await _apiClient.put(
      '/notifications/$id/read',
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }

  /// Delete notification
  Future<ApiResponse<Map<String, dynamic>>> deleteNotification(String id) async {
    return await _apiClient.delete(
      '/notifications/$id',
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }
}

