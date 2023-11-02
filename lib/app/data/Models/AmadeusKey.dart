// To parse this JSON data, do
//
//     final amadeusKey = amadeusKeyFromJson(jsonString);

import 'dart:convert';

AmadeusKey amadeusKeyFromJson(String str) =>
    AmadeusKey.fromJson(json.decode(str));

String amadeusKeyToJson(AmadeusKey data) => json.encode(data.toJson());

class AmadeusKey {
  String type;
  String username;
  String applicationName;
  String clientId;
  String tokenType;
  String accessToken;
  int expiresIn;
  String state;
  String scope;

  AmadeusKey({
    required this.type,
    required this.username,
    required this.applicationName,
    required this.clientId,
    required this.tokenType,
    required this.accessToken,
    required this.expiresIn,
    required this.state,
    required this.scope,
  });

  factory AmadeusKey.fromJson(Map<String, dynamic> json) => AmadeusKey(
        type: json["type"],
        username: json["username"],
        applicationName: json["application_name"],
        clientId: json["client_id"],
        tokenType: json["token_type"],
        accessToken: json["access_token"],
        expiresIn: json["expires_in"],
        state: json["state"],
        scope: json["scope"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "username": username,
        "application_name": applicationName,
        "client_id": clientId,
        "token_type": tokenType,
        "access_token": accessToken,
        "expires_in": expiresIn,
        "state": state,
        "scope": scope,
      };
}
