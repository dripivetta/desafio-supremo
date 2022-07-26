import 'package:desafio/models/amount_model.dart';
import 'package:desafio/models/detail_statement_model.dart';
import 'package:desafio/models/statement_model.dart';

abstract class StatementsRepository {
  Future<Amount> getAmount();
  Future<List<Statement>?> getStatements(int offset);
  //Future<List<DetStatement>> getStatementsDetail(int id);
  Future<DetStatement> getStatementsDetail();

}