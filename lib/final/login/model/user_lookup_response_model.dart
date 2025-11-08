import 'dart:convert';

import 'package:buildglory/models/user_model.dart';

UserLookupResponseModel userLookupResponseModelFromJson(String source) =>
    UserLookupResponseModel.fromJson(json.decode(source) as Map<String, dynamic>);

String userLookupResponseModelToJson(UserLookupResponseModel data) =>
    json.encode(data.toJson());

class UserLookupResponseModel {
  UserLookupResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory UserLookupResponseModel.fromJson(Map<String, dynamic> json) =>
      UserLookupResponseModel(
        status: json['status'] as int?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : UserModel.fromJson(json['data'] as Map<String, dynamic>),
      );

  final int? status;
  final String? message;
  final UserModel? data;

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
