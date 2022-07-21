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
    final _data = <String, dynamic>{};
    _data['amount'] = amount;
    _data['id'] = id;
    _data['authentication'] = authentication;
    _data['tType'] = tType;
    _data['createdAt'] = createdAt;
    _data['to'] = to;
    _data['description'] = description;
    return _data;
  }
}