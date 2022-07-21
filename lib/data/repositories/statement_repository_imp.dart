import 'package:desafio/data/repositories/statement_repository.dart';
import 'package:desafio/data/repositories/statements_remote_ds.dart';
import 'package:desafio/models/amount_model.dart';
import 'package:desafio/models/detail_statement_model.dart';
import 'package:desafio/models/statement_model.dart';

class StatementsRepositoryImpl implements StatementsRepository {
  final StatementsRemoteDataSource remoteDataSource;
  StatementsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Amount> getAmount() async {
    final result = await remoteDataSource.getAmount();
    return result;
  }

  @override
  Future<List<Statement>> getStatements() async {
    final result = await remoteDataSource.getStatements();
    return result;
  }

  // @override
  // Future<List<DetStatement>> getStatementsDetail(int id) async {
  //   final result = await remoteDataSource.getDetStatement(id);
  //   return result;
  // }
   @override
  Future<DetStatement> getStatementsDetail() async {
    final result = await remoteDataSource.getDetStatement();
    return result;
  }
}
