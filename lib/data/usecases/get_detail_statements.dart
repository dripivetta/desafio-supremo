import 'package:desafio/data/repositories/statement_repository.dart';
import 'package:desafio/models/detail_statement_model.dart';
import 'package:flutter/material.dart';

class GetDetStatements {
  final StatementsRepository repository;
  GetDetStatements(this.repository){
    get();
  }

  ValueNotifier<DetStatement?> detStatements = ValueNotifier<DetStatement?>(null);

  get() async {
      // ignore: avoid_print
      print('getting api');
      detStatements.value = await repository.getStatementsDetail();
    
  }
}