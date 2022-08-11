import 'package:desafio/domain/entities/amount.dart';

import 'package:either_dart/either.dart';

import '../../widgets/component/error_page/failure.dart';

abstract class AmountRepository {
  Future<Either<Failure, Amount>> getAmount();
}
