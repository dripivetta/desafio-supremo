class DetStatement {
  DetStatement({
    required this.amount,
    required this.id,
    required this.authentication,
    required this.tType,
    required this.createdAt,
    required this.to,
    required this.description,
  });
  late final int amount;
  late final String id;
  late final String authentication;
  late final String tType;
  late final String createdAt;
  late final String to;
  late final String description;
  
  DetStatement.fromJson(Map<String, dynamic> json){
    amount = json['amount'];
    id = json['id'];
    authentication = json['authentication'];
    tType = json['tType'];
    createdAt = json['createdAt'];
    to = json['to'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['amount'] = amount;
    data['id'] = id;
    data['authentication'] = authentication;
    data['tType'] = tType;
    data['createdAt'] = createdAt;
    data['to'] = to;
    data['description'] = description;
    return data;
  }
}