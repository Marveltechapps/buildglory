import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/notification_service.dart';
import 'notification_event.dart';
import 'notification_state.dart';

/// Notification BLoC
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationService _notificationService;

  NotificationBloc({
    required NotificationService notificationService,
  })  : _notificationService = notificationService,
        super(const NotificationInitial()) {
    on<LoadNotificationsEvent>(_onLoadNotifications);
    on<MarkNotificationAsReadEvent>(_onMarkAsRead);
    on<DeleteNotificationEvent>(_onDeleteNotification);
    on<ClearNotificationErrorEvent>(_onClearError);
  }

  Future<void> _onLoadNotifications(
    LoadNotificationsEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(const NotificationLoading());

    final response = await _notificationService.getUserNotifications();

    response.when(
      success: (notifications) {
        if (notifications.isEmpty) {
          emit(const NotificationsEmpty());
        } else {
          final unreadCount = notifications.where((n) => !n.isRead).length;
          emit(NotificationsLoaded(
            notifications: notifications,
            unreadCount: unreadCount,
          ));
        }
      },
      failure: (error) {
        emit(NotificationError(error.message));
      },
    );
  }

  Future<void> _onMarkAsRead(
    MarkNotificationAsReadEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final response = await _notificationService.markAsRead(event.notificationId);

    response.when(
      success: (_) {
        emit(NotificationMarkedAsRead(event.notificationId));
        // Reload notifications
        add(const LoadNotificationsEvent());
      },
      failure: (error) {
        emit(NotificationError(error.message));
      },
    );
  }

  Future<void> _onDeleteNotification(
    DeleteNotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final response = await _notificationService.deleteNotification(event.notificationId);

    response.when(
      success: (_) {
        emit(NotificationDeleted(event.notificationId));
        // Reload notifications
        add(const LoadNotificationsEvent());
      },
      failure: (error) {
        emit(NotificationError(error.message));
      },
    );
  }

  void _onClearError(
    ClearNotificationErrorEvent event,
    Emitter<NotificationState> emit,
  ) {
    emit(const NotificationInitial());
  }
}

