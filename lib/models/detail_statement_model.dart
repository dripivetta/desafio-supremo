import 'package:intl/intl.dart';

class DetStatement {
  DetStatement({
    required this.amount,
    required this.id,
    required this.authentication,
    required this.tType,
    required this.createdAt,
     this.to,
     this.from,
    required this.description,
  });
  late final int amount;
  late final String id;
  late final String authentication;
  late final String tType;
  late final DateTime createdAt;
  late final String? to;
  late final String? from;
  late final String description;
  
  DetStatement.fromJson(Map<String, dynamic> json){
    amount = json['amount'];
    id = json['id'];
    authentication = json['authentication'];
    tType = json['tType'];
    createdAt = DateTime.parse(json['createdAt']);
    to = json['to'];
    from = json['from'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['amount'] = amount;
    data['id'] = id;
    data['authentication'] = authentication;
    data['tType'] = tType;
    data["createdAt"] = DateFormat("yyyy-MM-dd'T'hh:mm:ss'Z'").format(createdAt);
    data['to'] = to;
    data['from'] = from;
    data['description'] = description;
    return data;
  }
  DetStatement toEntity() => DetStatement(
        createdAt: createdAt,
        id: id,
        amount: amount,
        to: to,
        from: from,
        description: description,
        tType: tType,
        authentication: authentication,
      );
}