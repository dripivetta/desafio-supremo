import 'package:desafio/data/repositories/repository.dart';
import 'package:desafio/models/detail_statement_model.dart';
import 'package:flutter/material.dart';

class GetDetStatements {
  final DetStatementsRepository repository;
  GetDetStatements(this.repository);
  
  Future<DetStatement> get(String id) {
    // ignore: avoid_print
    print('getting api');
    return repository.getStatementsDetail(id);
  }
}
