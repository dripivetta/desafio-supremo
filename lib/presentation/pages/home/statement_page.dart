import 'package:desafio/data/datasources/amount_remote_ds.dart';
import 'package:desafio/data/repositories/amount_repository_imp.dart';
import 'package:desafio/data/usecases/get_amount.dart';
import 'package:desafio/models/amount_model.dart';
import 'package:desafio/models/statement_model.dart';
import 'package:desafio/services/http_service_imp.dart';
import 'package:desafio/widgets/amount_widget.dart';
import 'package:desafio/widgets/component/base_loading_pages/loading_progress.dart';
import 'package:desafio/widgets/statements_list_widget.dart';
import 'package:flutter/material.dart';

class StatementPage extends StatefulWidget {
  const StatementPage(
      {Key? key,
      required this.statementsList,
      required this.controller,
      required this.isLoadMoreRunning})
      : super(key: key);

  final List<Statement> statementsList;
  final ScrollController controller;
  final bool isLoadMoreRunning;

  @override
  State<StatementPage> createState() => _StatementPageState();
}

class _StatementPageState extends State<StatementPage> {
  final GetAmount amount = GetAmount(
    AmountRepositoryImpl(
      AmountRemoteDataSourceImpl(
        httpService: HttpServiceImpl(),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          'Extrato',
          style: TextStyle(
            fontFamily: 'Khalid',
            shadows: const <Shadow>[
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
            valueListenable: amount.amount,
            builder: (__, amount, _) {
              return amount != null
                  ? AmountWidget(amount: amount) //Widget Ricardo
                  : Center(
                      child: CustomLoading(),
                    );
            },
          ),

          Expanded(
            //flex: 10,
            child: StatementsListWidget(
              statementsList: widget.statementsList,
              controller: widget.controller,
            ),
          ),

          if (widget.isLoadMoreRunning == true)
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 40),
              child: Center(
                child: CustomLoading(),
              ),
            ),

          // When nothing else to load
          //if (_hasNextPage == false)
          //Text('chegou no final')
        ],
      ),
    );
  }
}
