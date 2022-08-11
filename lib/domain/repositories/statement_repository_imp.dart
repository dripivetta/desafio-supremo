import 'package:desafio/domain/entities/statement.dart';
import 'package:either_dart/either.dart';

import '../../widgets/component/error_page/failure.dart';

abstract class StatementsRepository {
  Future<Either<Failure,List<Statement>>> getStatements(int defautLimit, int offset);
}

