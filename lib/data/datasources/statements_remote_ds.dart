import 'package:desafio/data/utils/urls.dart';
import 'package:desafio/models/statement_model.dart';
import 'package:desafio/services/http_service.dart';

abstract class StatementsRemoteDataSource {
  Future<List<Statement>> getStatements(int limit, int offset);
}

class StatementsRemoteDataSourceImpl implements StatementsRemoteDataSource {
  final HttpService httpService;
  StatementsRemoteDataSourceImpl({required this.httpService});

  @override
  Future<List<Statement>> getStatements(int limit, int offset) async {
    var response = await httpService.get(Urls.statement(limit, offset));
    List statements = response['items'] as List;
    List<Statement> statement = [
      for (final item in statements) Statement.fromJson(item)
    ];

    return statement;
  }
}
