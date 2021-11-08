// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    required this.success,
    required this.message,
  });

  bool success;
  RegisterMessage message;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        success: json["success"],
        message: RegisterMessage.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message.toJson(),
      };
}

class RegisterMessage {
  RegisterMessage({
    required this.role,
    required this.id,
    required this.username,
    required this.v,
  });

  String role;
  String id;
  String username;
  int v;

  factory RegisterMessage.fromJson(Map<String, dynamic> json) =>
      RegisterMessage(
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
