import 'dart:convert';

import 'package:desafio/models/transactions.dart';
import 'package:desafio/services/webclient.dart';
import 'package:http/http.dart';


class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client
        .get(Uri.parse(baseUrl)).timeout(const Duration(seconds: 30));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }
}
