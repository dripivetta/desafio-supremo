import 'package:desafio/data/repositories/repository.dart';
import 'package:desafio/models/amount_model.dart';
import 'package:flutter/material.dart';

class GetAmount {
  final AmountRepository repository;
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
