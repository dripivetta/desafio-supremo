
import 'package:desafio/data/repositories/statement_repository_imp.dart';
import 'package:desafio/data/repositories/statements_remote_ds.dart';
import 'package:desafio/data/usecases/get_amount.dart';
import 'package:desafio/data/usecases/get_detail_statements.dart';
import 'package:desafio/data/usecases/get_statements.dart';
import 'package:desafio/services/http_service_imp.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

// final GetStatements controller = GetStatements(
//   StatementsRepositoryImpl(
//     StatementsRemoteDataSourceImpl(
//       httpService: HttpServiceImpl(),
//     ),
//   ),
// );

final GetDetStatements controller = GetDetStatements(
  StatementsRepositoryImpl(
    StatementsRemoteDataSourceImpl(
      httpService: HttpServiceImpl(),
    ),
  ),
);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const[
          
        ],
      ),
    );
  }
}