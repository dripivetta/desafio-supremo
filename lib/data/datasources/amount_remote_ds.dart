import 'package:desafio/data/utils/urls.dart';
import 'package:desafio/models/amount_model.dart';
import 'package:desafio/services/http_service.dart';

abstract class AmountRemoteDataSource {
  Future<Amount> getAmount();
}

class AmountRemoteDataSourceImpl implements AmountRemoteDataSource {
  final HttpService httpService;
  AmountRemoteDataSourceImpl({required this.httpService});

  @override
  Future<Amount> getAmount() async {
    final response = await httpService.get(Urls.amount());
    Amount amount = Amount.fromJson(response);

    return amount;
  }
}
