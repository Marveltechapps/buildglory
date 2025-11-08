class SavedProperty {
  final String? id;
  final String userId;
  final List<String> savedProperties;

  SavedProperty({
    this.id,
    required this.userId,
    this.savedProperties = const [],
  });

  factory SavedProperty.fromJson(Map<String, dynamic> json) {
    return SavedProperty(
      id: json['_id'] as String?,
      userId: json['userId'] as String,
      savedProperties: json['savedProperties'] != null
          ? List<String>.from(json['savedProperties'] as List)
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) '_id': id,
      'userId': userId,
      'savedProperties': savedProperties,
    };
  }

  SavedProperty copyWith({
    String? id,
    String? userId,
    List<String>? savedProperties,
  }) {
    return SavedProperty(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      savedProperties: savedProperties ?? this.savedProperties,
    );
  }
}

