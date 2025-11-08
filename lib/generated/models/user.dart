class User {
  final String? id;
  final String mobileNumber;
  final String? email;
  final String? name;
  final bool isVerified;
  final String? profileImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.id,
    required this.mobileNumber,
    this.email,
    this.name,
    this.isVerified = false,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String?,
      mobileNumber: json['mobileNumber'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
      profileImage: json['profileImage'] as String?,
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
      'mobileNumber': mobileNumber,
      if (email != null) 'email': email,
      if (name != null) 'name': name,
      'isVerified': isVerified,
      if (profileImage != null) 'profileImage': profileImage,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
    };
  }

  User copyWith({
    String? id,
    String? mobileNumber,
    String? email,
    String? name,
    bool? isVerified,
    String? profileImage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      email: email ?? this.email,
      name: name ?? this.name,
      isVerified: isVerified ?? this.isVerified,
      profileImage: profileImage ?? this.profileImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

