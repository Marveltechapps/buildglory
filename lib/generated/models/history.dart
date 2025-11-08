class History {
  final String? id;
  final String userId;
  final List<String> buyList;
  final List<String> exchangeList;
  final List<String> sellList;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  History({
    this.id,
    required this.userId,
    this.buyList = const [],
    this.exchangeList = const [],
    this.sellList = const [],
    this.createdAt,
    this.updatedAt,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['_id'] as String?,
      userId: json['userId'] as String,
      buyList: json['buyList'] != null
          ? List<String>.from(json['buyList'] as List)
          : [],
      exchangeList: json['exchangeList'] != null
          ? List<String>.from(json['exchangeList'] as List)
          : [],
      sellList: json['sellList'] != null
          ? List<String>.from(json['sellList'] as List)
          : [],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) '_id': id,
      'userId': userId,
      'buyList': buyList,
      'exchangeList': exchangeList,
      'sellList': sellList,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
    };
  }

  History copyWith({
    String? id,
    String? userId,
    List<String>? buyList,
    List<String>? exchangeList,
    List<String>? sellList,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return History(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      buyList: buyList ?? this.buyList,
      exchangeList: exchangeList ?? this.exchangeList,
      sellList: sellList ?? this.sellList,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

