class Statement {
  List<Items>? items;

  Statement({this.items});

  Statement.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? createdAt;
  String? id;
  int? amount;
  String? to;
  String? description;
  String? tType;
  String? from;
  String? bankName;

  Items(
      {this.createdAt,
      this.id,
      this.amount,
      this.to,
      this.description,
      this.tType,
      this.from,
      this.bankName});

  Items.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    id = json['id'];
    amount = json['amount'];
    to = json['to'];
    description = json['description'];
    tType = json['tType'];
    from = json['from'];
    bankName = json['bankName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['id'] = id;
    data['amount'] = amount;
    data['to'] = to;
    data['description'] = description;
    data['tType'] = tType;
    data['from'] = from;
    data['bankName'] = bankName;
    return data;
  }
}
