import 'package:desafio/data/repositories/repository.dart';
import 'package:desafio/models/statement_model.dart';

class GetStatements {
  final StatementsRepository repository;
  GetStatements(this.repository);

  //ValueNotifier<List<Statement>?> statements = ValueNotifier<List<Statement>?>(null);

  Future<List<Statement>?> get(int limit, int offset) {
    // ignore: avoid_print
    print('getting api');

    return repository.getStatements(limit, offset);
  }
}
