import 'package:equatable/equatable.dart';

/// Notification Events
abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

/// Load user notifications
class LoadNotificationsEvent extends NotificationEvent {
  const LoadNotificationsEvent();
}

/// Mark notification as read
class MarkNotificationAsReadEvent extends NotificationEvent {
  final String notificationId;

  const MarkNotificationAsReadEvent(this.notificationId);

  @override
  List<Object?> get props => [notificationId];
}

/// Delete notification
class DeleteNotificationEvent extends NotificationEvent {
  final String notificationId;

  const DeleteNotificationEvent(this.notificationId);

  @override
  List<Object?> get props => [notificationId];
}

/// Clear notifications error
class ClearNotificationErrorEvent extends NotificationEvent {
  const ClearNotificationErrorEvent();
}

