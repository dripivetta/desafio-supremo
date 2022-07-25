import 'package:desafio/data/repositories/statement_repository.dart';
import 'package:desafio/models/amount_model.dart';
import 'package:flutter/material.dart';

class GetAmount {
  final StatementsRepository repository;
  GetAmount(this.repository) {
    get();
  }

  ValueNotifier<Amount?> amount = ValueNotifier<Amount?>(null);

  get() async {
    // ignore: avoid_print
    print('getting api');
    amount.value = await repository.getAmount();
  }
}
