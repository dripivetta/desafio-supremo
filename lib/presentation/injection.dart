import 'package:desafio/data/datasources/amount_remote_ds.dart';
import 'package:desafio/data/datasources/comprovante_remote_ds.dart';
import 'package:desafio/data/datasources/statements_remote_ds.dart';
import 'package:desafio/data/repositories/amount_repository_imp.dart';
import 'package:desafio/data/repositories/comprovante_repository_imp.dart';
import 'package:desafio/data/repositories/statement_repository_imp.dart';
import 'package:desafio/domain/repositories/amount_repository_imp.dart';
import 'package:desafio/domain/repositories/comprovante_repository_imp.dart';
import 'package:desafio/domain/repositories/statement_repository_imp.dart';
import 'package:desafio/domain/usecases/get_amount.dart';
import 'package:desafio/domain/usecases/get_comprovante.dart';
import 'package:desafio/domain/usecases/get_statements.dart';
import 'package:desafio/presentation/bloc/amount/amount_bloc.dart';
import 'package:desafio/presentation/bloc/comprovante/comprovante_bloc.dart';
import 'package:desafio/presentation/bloc/statement/statement_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  // repositories
  getIt.registerLazySingleton<AmountRepository>(
    () => AmountRepositoryImpl(amountRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<StatementsRepository>(
    () => StatementsRepositoryImpl(stetementRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<DetStatementsRepository>(
    () => DetStatementsRepositoryImpl(
      detRemoteDataSource: getIt(),
    ),
  );

  // usecases
  getIt.registerLazySingleton(
    () => GetAmount(
      getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetStatements(
      getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetDetStatements(
      getIt(),
    ),
  );

  // datasources
  getIt.registerLazySingleton<AmountRemoteDataSource>(
    () => AmountRemoteDataSourceImpl(
      client: getIt(),
    ),
  );

  getIt.registerLazySingleton<StatementsRemoteDataSource>(
    () => StatementsRemoteDataSourceImpl(
      client: getIt(),
    ),
  );

  getIt.registerLazySingleton<DetStatementsRemoteDataSource>(
    () => DetStatementsRemoteDataSourceImpl(
      client: getIt(),
    ),
  );

  // blocs
  getIt.registerFactory(
    () => AmountBloc(
      getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => StatementBloc(
      getIt(),
    ),
  );
  getIt.registerFactory(
    () => DetailStatementBloc(
      getIt(),
    ),
  );

  // http
  getIt.registerLazySingleton(
    () => http.Client(),
  );
}
