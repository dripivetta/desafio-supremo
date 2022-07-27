import 'package:desafio/data/utils/urls.dart';
import 'package:desafio/models/amount_model.dart';
import 'package:desafio/models/detail_statement_model.dart';
import 'package:desafio/models/statement_model.dart';
import 'package:desafio/services/http_service.dart';

abstract class DetStatementsRemoteDataSource {
  Future<DetStatement> getDetStatement();
}

class DetStatementsRemoteDataSourceImpl implements DetStatementsRemoteDataSource {
  final HttpService httpService;
  DetStatementsRemoteDataSourceImpl({required this.httpService});

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
