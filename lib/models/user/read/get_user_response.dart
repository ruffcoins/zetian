// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    this.success,
    this.message,
  });

  bool? success;
  List<User>? message;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    success: json["success"],
    message: List<User>.from(json["message"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": List<dynamic>.from(message!.map((x) => x.toJson())),
  };
}

class User {
  User({
    this.role,
    this.id,
    this.username,
    this.v,
  });

  String? role;
  String? id;
  String? username;
  int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
    role: json["role"],
    id: json["_id"],
    username: json["username"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "role": role,
    "_id": id,
    "username": username,
    "__v": v,
  };
}
