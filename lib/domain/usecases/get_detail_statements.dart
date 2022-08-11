import 'package:desafio/domain/entities/detailStatement.dart';
import 'package:desafio/domain/repositories/detStatement_repository_imp.dart';
import 'package:desafio/widgets/component/error_page/failure.dart';

import 'package:either_dart/either.dart';

class GetDetStatements {
  final DetStatementsRepository repository;
  GetDetStatements(this.repository);
  
  Future<Either<Failure, DetStatement>> get(String id) {
    // ignore: avoid_print
    print('getting api');
    return repository.getStatementsDetail(id);
  }
}
