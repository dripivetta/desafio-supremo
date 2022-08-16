import 'package:desafio/domain/entities/comprovante.dart';
import 'package:desafio/domain/repositories/comprovante_repository_imp.dart';
import 'package:desafio/presentation/widgets/component/error/failure.dart';
import 'package:either_dart/either.dart';

class GetDetStatements {
  final DetStatementsRepository repository;
  GetDetStatements(this.repository);
  
  Future<Either<Failure, DetStatement>> get(String id) {
    // ignore: avoid_print
    print('getting comprovante api..');
    return repository.getStatementsDetail(id);
  }
}
