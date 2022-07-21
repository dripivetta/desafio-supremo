import 'dart:convert';

import 'package:desafio/models/transactions.dart';
import 'package:desafio/services/webclient.dart';
import 'package:http/http.dart';


class TransactionWebClient {
  //Future<List<Transaction>> findAll() async {                => QUANDO FICAR PRONTO O MODEL DE TRANSACTIONS
  Future<List> findAll() async {    // apagar esta linha quando implementar a linha acima
    final Response response = await client
        .get(Uri.parse(baseUrl)).timeout(const Duration(seconds: 30));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }
}
