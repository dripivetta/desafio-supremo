// To parse this JSON data, do
//
//     final statement = statementFromJson(jsonString);

import 'dart:convert';

List<Statement> statementFromJson(String str) => List<Statement>.from(json.decode(str).map((x) => Statement.fromJson(x)));

String statementToJson(List<Statement> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Statement {
  
    Statement({
        required this.createdAt,
        required this.id,
        required this.amount,
        required this.description,
        required this.tType,
        this.to,
        this.from,
        this.bankName,
    });

    DateTime createdAt;
    String id;
    int amount;
    String? to;
    String description;
    String tType;
    String? from;
    String? bankName;

    factory Statement.fromJson(Map<String, dynamic> json) => Statement(
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["id"],
        amount: json["amount"],
        to: json["to"],
        description: json["description"],
        tType: json["tType"],
        from: json["from"],
        bankName: json["bankName"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "id": id,
        "amount": amount,
        "to": to,
        "description": description,
        "tType": tType,
        "from": from,
        "bankName": bankName,
    };
}
