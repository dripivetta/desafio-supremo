import 'package:desafio/data/repositories/repository.dart';
import 'package:desafio/data/datasources/statements_remote_ds.dart';
import 'package:desafio/models/statement_model.dart';

class StatementsRepositoryImpl implements StatementsRepository {
  final StatementsRemoteDataSource remoteDataSource;
  StatementsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Statement>> getStatements(int limit, int offset) async {
    final result = await remoteDataSource.getStatements(limit, offset);
    return result.map((e) => e.toEntity()).toList();
  }
}
