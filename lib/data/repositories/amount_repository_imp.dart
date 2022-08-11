import 'dart:io';
import 'package:desafio/data/datasources/amount_remote_ds.dart';
import 'package:desafio/domain/entities/amount.dart';
import 'package:desafio/domain/repositories/amount_repository_imp.dart';
import 'package:desafio/widgets/component/error_page/failure.dart';
import 'package:either_dart/either.dart';
import '../../widgets/component/error_page/exception.dart';

class AmountRepositoryImpl implements AmountRepository {
  final AmountRemoteDataSource amountRemoteDataSource;
  AmountRepositoryImpl({required this.amountRemoteDataSource});

  @override
  Future<Either<Failure, Amount>> getAmount()async {
    try {
      final result = await amountRemoteDataSource.getAmount();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the Network'));
    }
  }
}
