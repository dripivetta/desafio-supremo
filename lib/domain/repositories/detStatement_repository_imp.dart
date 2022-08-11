// ignore_for_file: file_names
import 'package:desafio/domain/entities/detailStatement.dart';
import 'package:either_dart/either.dart';
import '../../widgets/component/error_page/failure.dart';

abstract class DetStatementsRepository {
  Future<Either<Failure,DetStatement>> getStatementsDetail(String id);
}
