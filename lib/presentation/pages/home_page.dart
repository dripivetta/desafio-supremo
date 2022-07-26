import 'package:desafio/data/repositories/statement_repository_imp.dart';
import 'package:desafio/data/repositories/statements_remote_ds.dart';
import 'package:desafio/data/usecases/get_amount.dart';
import 'package:desafio/data/usecases/get_statements.dart';
import 'package:desafio/models/amount_model.dart';
import 'package:desafio/models/statement_model.dart';
import 'package:desafio/widgets/statements_list_widget.dart';
import 'package:desafio/services/http_service_imp.dart';
import 'package:desafio/widgets/amount_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetAmount _amount = GetAmount(
    StatementsRepositoryImpl(
      StatementsRemoteDataSourceImpl(
        httpService: HttpServiceImpl(),
      ),
    ),
  );
  final GetStatements _statement = GetStatements(
    StatementsRepositoryImpl(
      StatementsRemoteDataSourceImpl(
        httpService: HttpServiceImpl(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Extrato',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 4.0),
                blurRadius: 8.0,
                color: Color.fromARGB(255, 190, 185, 185),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          ValueListenableBuilder<Amount?>(
            valueListenable: _amount.amount,
            builder: (__, amount, _) {
              return amount != null
                  ? AmountWidget(amount: amount) //Widget Ricardo
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
          Text('Suas movimentações'),
          ValueListenableBuilder<List<Statement>?>(
            valueListenable: _statement.statements,
            builder: (__, statements, _) {
              return statements != null
                  ? StatementsListWidget(statements: statements) //Widget Igor
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ],
      ),
    );
  }
}
