import 'package:desafio/domain/entities/statement.dart';
import 'package:desafio/domain/repositories/statement_repository_imp.dart';
import 'package:either_dart/either.dart';
import '../../widgets/component/error_page/failure.dart';


class GetStatements {
  final StatementsRepository repository;
  GetStatements(this.repository);

  Future<Either<Failure, List<Statement>>> get(int defautLimit,int offset) {
    // ignore: avoid_print
    print('getting api..');
    return repository.getStatements(defautLimit, offset);
  }
}
