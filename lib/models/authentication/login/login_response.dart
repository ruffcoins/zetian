// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.success,
    required this.message,
    required this.token,
  });

  bool success;
  LoginMessage message;
  String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: LoginMessage.fromJson(json["message"]),
        token: json["token"]
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message.toJson(),
        "token": token
      };
}

class LoginMessage {
  LoginMessage({
    required this.role,
    required this.id,
    required this.username,
    required this.v,
  });

  String role;
  String id;
  String username;
  int v;

  factory LoginMessage.fromJson(Map<String, dynamic> json) => LoginMessage(
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
