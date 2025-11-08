enum NotificationCategory {
  buy('Buy'),
  sell('Sell'),
  exchange('Exchange'),
  system('System');

  final String value;
  const NotificationCategory(this.value);

  static NotificationCategory fromString(String value) {
    return NotificationCategory.values.firstWhere(
      (e) => e.value == value,
      orElse: () => NotificationCategory.system,
    );
  }
}

enum NotificationEventCode {
  buyCreated('BUY_CREATED'),
  buyMatched('BUY_MATCHED'),
  buyCompleted('BUY_COMPLETED'),
  buyRejected('BUY_REJECTED'),
  buyPriceUpdated('BUY_PRICE_UPDATED'),
  sellCreated('SELL_CREATED'),
  sellInterest('SELL_INTEREST'),
  sellClosed('SELL_CLOSED'),
  exchangeProposed('EXCHANGE_PROPOSED'),
  exchangeMatched('EXCHANGE_MATCHED'),
  exchangeCompleted('EXCHANGE_COMPLETED'),
  exchangeFailed('EXCHANGE_FAILED'),
  systemPolicyUpdate('SYSTEM_POLICY_UPDATE'),
  systemAppUpdate('SYSTEM_APP_UPDATE');

  final String value;
  const NotificationEventCode(this.value);

  static NotificationEventCode fromString(String value) {
    return NotificationEventCode.values.firstWhere(
      (e) => e.value == value,
      orElse: () => NotificationEventCode.systemAppUpdate,
    );
  }
}

class AppNotification {
  final String? id;
  final String userId;
  final NotificationCategory category;
  final NotificationEventCode eventCode;
  final String? propertyId;
  final String message;
  final DateTime timestamp;
  final bool isRead;

  AppNotification({
    this.id,
    required this.userId,
    required this.category,
    required this.eventCode,
    this.propertyId,
    required this.message,
    required this.timestamp,
    this.isRead = false,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['_id'] as String?,
      userId: json['userId'] as String,
      category: NotificationCategory.fromString(json['category'] as String),
      eventCode: NotificationEventCode.fromString(json['eventCode'] as String),
      propertyId: json['propertyId'] as String?,
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) '_id': id,
      'userId': userId,
      'category': category.value,
      'eventCode': eventCode.value,
      if (propertyId != null) 'propertyId': propertyId,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
    };
  }

  AppNotification copyWith({
    String? id,
    String? userId,
    NotificationCategory? category,
    NotificationEventCode? eventCode,
    String? propertyId,
    String? message,
    DateTime? timestamp,
    bool? isRead,
  }) {
    return AppNotification(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      category: category ?? this.category,
      eventCode: eventCode ?? this.eventCode,
      propertyId: propertyId ?? this.propertyId,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
    );
  }
}

