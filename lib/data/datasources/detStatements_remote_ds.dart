import 'package:desafio/data/utils/urls.dart';
import 'package:desafio/models/detail_statement_model.dart';
import 'package:desafio/services/http_service.dart';

abstract class DetStatementsRemoteDataSource {
  Future<DetStatement> getDetStatement();
}

class DetStatementsRemoteDataSourceImpl implements DetStatementsRemoteDataSource {
  final HttpService httpService;
  DetStatementsRemoteDataSourceImpl({required this.httpService});

  @override
  Future<DetStatement> getDetStatement() async {
    var response = await httpService.get(Urls.statementDetail);
    DetStatement detStatements = DetStatement.fromJson(response);

    return detStatements;
  }
}
