import 'package:desafio/data/utils/urls.dart';
import 'package:desafio/models/amount_model.dart';
import 'package:desafio/models/detail_statement_model.dart';
import 'package:desafio/models/statement_model.dart';
import 'package:desafio/services/http_service.dart';

abstract class StatementsRemoteDataSource {
  Future<List<Statement>> getStatements(int offset);
  Future<DetStatement> getDetStatement();
  Future<Amount> getAmount();
}

class StatementsRemoteDataSourceImpl implements StatementsRemoteDataSource {
  final HttpService httpService;
  StatementsRemoteDataSourceImpl({required this.httpService});

  @override
  Future<Amount> getAmount() async {
    var response = await httpService.get(Urls.amount());
    Amount amount = Amount.fromJson(response);

    return amount;
  }

  @override
  Future<List<Statement>> getStatements(int offset) async {
    var response = await httpService.get(Urls.statement(offset));
    var statements = response['items'] as List;
    List<Statement> statement = [
      for (final item in statements) Statement.fromJson(item)
    ];

    return statement;
  }

  // @override
  // Future<List<DetStatement>> getDetStatement(int id) async {
  //   var response = await httpService.get(Urls.statementDetail(id));
  //   var detStatements = response['items'] as List;
  //   List<DetStatement> detStatement = [
  //     for (final item in detStatements) DetStatement.fromJson(item)
  //   ];

  //   return detStatement;
  // }
  @override
  Future<DetStatement> getDetStatement() async {
    var response = await httpService.get(Urls.statementDetail);
    DetStatement detStatements = DetStatement.fromJson(response);

    return detStatements;
  }
}
