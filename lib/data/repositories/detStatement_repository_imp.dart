import 'package:desafio/data/datasources/detStatements_remote_ds.dart';
import 'package:desafio/data/repositories/repository.dart';
import 'package:desafio/models/detail_statement_model.dart';

class DetStatementsRepositoryImpl implements DetStatementsRepository {
  final DetStatementsRemoteDataSource remoteDataSource;
  DetStatementsRepositoryImpl(this.remoteDataSource);

  @override
  Future<DetStatement> getStatementsDetail(String id) async {
    final result = await remoteDataSource.getDetStatement(id);
    return result;
  }
}
