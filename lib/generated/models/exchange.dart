class Exchange {
  final String? id;
  final String userId;
  final String sellerProperty;
  final List<String> matchedProperties;
  final bool fallbackToBuy;
  final DateTime? createdAt;

  Exchange({
    this.id,
    required this.userId,
    required this.sellerProperty,
    this.matchedProperties = const [],
    this.fallbackToBuy = false,
    this.createdAt,
  });

  factory Exchange.fromJson(Map<String, dynamic> json) {
    return Exchange(
      id: json['_id'] as String?,
      userId: json['userId'] as String,
      sellerProperty: json['sellerProperty'] as String,
      matchedProperties: json['matchedProperties'] != null
          ? List<String>.from(json['matchedProperties'] as List)
          : [],
      fallbackToBuy: json['fallbackToBuy'] as bool? ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) '_id': id,
      'userId': userId,
      'sellerProperty': sellerProperty,
      'matchedProperties': matchedProperties,
      'fallbackToBuy': fallbackToBuy,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
    };
  }

  Exchange copyWith({
    String? id,
    String? userId,
    String? sellerProperty,
    List<String>? matchedProperties,
    bool? fallbackToBuy,
    DateTime? createdAt,
  }) {
    return Exchange(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      sellerProperty: sellerProperty ?? this.sellerProperty,
      matchedProperties: matchedProperties ?? this.matchedProperties,
      fallbackToBuy: fallbackToBuy ?? this.fallbackToBuy,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

