class UserModel {
  UserModel({
    this.id,
    this.mobileNumber,
    this.email,
    this.name,
    this.otp,
    this.otpExpiry,
    this.isVerified,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['_id'] as String?,
        mobileNumber: json['mobileNumber'] as String?,
        email: json['email'] as String?,
        name: json['name'] as String?,
        otp: json['otp'] as String?,
        otpExpiry: json['otpExpiry'] as String?,
        isVerified: json['isVerified'] as bool?,
        profileImage: json['profileImage'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
      );

  final String? id;
  final String? mobileNumber;
  final String? email;
  final String? name;
  final String? otp;
  final String? otpExpiry;
  final bool? isVerified;
  final String? profileImage;
  final String? createdAt;
  final String? updatedAt;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'mobileNumber': mobileNumber,
        'email': email,
        'name': name,
        'otp': otp,
        'otpExpiry': otpExpiry,
        'isVerified': isVerified,
        'profileImage': profileImage,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
