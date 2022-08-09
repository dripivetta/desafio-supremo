import 'package:desafio/data/datasources/amount_remote_ds.dart';
import 'package:desafio/data/repositories/repository.dart';
import 'package:desafio/models/amount_model.dart';

class AmountRepositoryImpl implements AmountRepository {
  final AmountRemoteDataSource remoteDataSource;
  AmountRepositoryImpl(this.remoteDataSource);

  @override
  Future<Amount> getAmount() async {
    final result = await remoteDataSource.getAmount();
    return result;
  }
}
