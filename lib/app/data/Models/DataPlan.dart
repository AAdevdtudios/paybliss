import 'dart:convert';

class DataPlan {
  String planCode;
  String name;
  int amount;

  DataPlan({
    required this.planCode,
    required this.name,
    required this.amount,
  });

  factory DataPlan.fromRawJson(String str) =>
      DataPlan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataPlan.fromJson(Map<String, dynamic> json) => DataPlan(
        planCode: json["plan_code"],
        name: json["name"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "plan_code": planCode,
        "name": name,
        "amount": amount,
      };
}
