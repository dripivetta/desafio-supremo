import 'package:desafio/data/repositories/statement_repository.dart';
import 'package:desafio/models/statement_model.dart';
import 'package:flutter/material.dart';

class GetStatements {
  final StatementsRepository repository;
  GetStatements(this.repository){
    get();
  }

  ValueNotifier<List<Statement>?> statements = ValueNotifier<List<Statement>?>(null);

  get() async {
      // ignore: avoid_print
      print('getting api');
      statements.value = await repository.getStatements();
    
  }
}