class Feedback {
  final String? id;
  final String? userId;
  final String fullName;
  final String email;
  final String subject;
  final String message;
  final DateTime? timestamp;

  Feedback({
    this.id,
    this.userId,
    required this.fullName,
    required this.email,
    required this.subject,
    required this.message,
    this.timestamp,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      subject: json['subject'] as String,
      message: json['message'] as String,
      timestamp: json['timestamp'] != null
          ? DateTime.parse(json['timestamp'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) '_id': id,
      if (userId != null) 'userId': userId,
      'fullName': fullName,
      'email': email,
      'subject': subject,
      'message': message,
      if (timestamp != null) 'timestamp': timestamp!.toIso8601String(),
    };
  }

  Feedback copyWith({
    String? id,
    String? userId,
    String? fullName,
    String? email,
    String? subject,
    String? message,
    DateTime? timestamp,
  }) {
    return Feedback(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      subject: subject ?? this.subject,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

