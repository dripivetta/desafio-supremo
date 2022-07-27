import 'package:desafio/models/amount_model.dart';
import 'package:desafio/models/detail_statement_model.dart';
import 'package:desafio/models/statement_model.dart';

abstract class StatementsRepository {
  Future<List<Statement>?> getStatements(int limit, int offset);
}

abstract class AmountRepository {
  Future<Amount> getAmount();
}

abstract class DetStatementsRepository {
  //Future<List<DetStatement>> getStatementsDetail(int id);
  Future<DetStatement> getStatementsDetail();

}