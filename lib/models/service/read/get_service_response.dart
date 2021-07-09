// To parse this JSON data, do
//
//     final getServiceResponse = getServiceResponseFromJson(jsonString);

import 'dart:convert';

GetServiceResponse getServiceResponseFromJson(String str) =>
    GetServiceResponse.fromJson(json.decode(str));

String getServiceResponseToJson(GetServiceResponse data) =>
    json.encode(data.toJson());

class GetServiceResponse {
  GetServiceResponse({
    required this.success,
    required this.message,
  });

  bool success;
  List<Message> message;

  factory GetServiceResponse.fromJson(Map<String, dynamic> json) =>
      GetServiceResponse(
        success: json["success"],
        message:
            List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": List<dynamic>.from(message.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    required this.id,
    required this.name,
    required this.amount,
  });

  String id;
  String name;
  int amount;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"],
        name: json["name"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "amount": amount,
      };
}
