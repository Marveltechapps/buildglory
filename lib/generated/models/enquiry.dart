enum EnquiryType {
  buy('Buy'),
  exchange('Exchange');

  final String value;
  const EnquiryType(this.value);

  static EnquiryType fromString(String value) {
    return EnquiryType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => EnquiryType.buy,
    );
  }
}

class Enquiry {
  final String? id;
  final String userId;
  final String propertyId;
  final String? message;
  final EnquiryType type;
  final DateTime? timestamp;

  Enquiry({
    this.id,
    required this.userId,
    required this.propertyId,
    this.message,
    required this.type,
    this.timestamp,
  });

  factory Enquiry.fromJson(Map<String, dynamic> json) {
    return Enquiry(
      id: json['_id'] as String?,
      userId: json['userId'] as String,
      propertyId: json['propertyId'] as String,
      message: json['message'] as String?,
      type: EnquiryType.fromString(json['type'] as String),
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) '_id': id,
      'userId': userId,
      'propertyId': propertyId,
      if (message != null) 'message': message,
      'type': type.value,
      if (timestamp != null) 'timestamp': timestamp!.toIso8601String(),
    };
  }

  Enquiry copyWith({
    String? id,
    String? userId,
    String? propertyId,
    String? message,
    EnquiryType? type,
    DateTime? timestamp,
  }) {
    return Enquiry(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      propertyId: propertyId ?? this.propertyId,
      message: message ?? this.message,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

