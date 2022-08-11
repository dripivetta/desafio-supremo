import 'package:desafio/domain/entities/amount.dart';
import 'package:desafio/domain/repositories/amount_repository_imp.dart';

import 'package:either_dart/either.dart';

import '../../widgets/component/error_page/failure.dart';

class GetAmount {
  final AmountRepository repository;
  GetAmount(this.repository);

  Future<Either<Failure,Amount>> get() {
    // ignore: avoid_print
    print('getting api');
    return repository.getAmount();
  }
}
