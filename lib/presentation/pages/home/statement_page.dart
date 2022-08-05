import 'package:desafio/injection.dart';
import 'package:desafio/presentation/bloc/amount/amount_bloc.dart';
import 'package:desafio/presentation/bloc/amount/amount_event.dart';
import 'package:desafio/presentation/bloc/amount/amount_state.dart';
import 'package:desafio/presentation/bloc/statement/statement_state.dart';
import 'package:desafio/widgets/amount_widget.dart';
import 'package:desafio/widgets/statements_list_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatementPage extends StatefulWidget {
  const StatementPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;
  //final StatementHasData state;

  @override
  State<StatementPage> createState() => _StatementPageState();
}

class _StatementPageState extends State<StatementPage> {
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
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AmountWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const[
                Padding(
          padding: EdgeInsets.only(top:12, left: 15, bottom: 12),
          child: SizedBox(
                child: Text(
                  'Suas movimentações',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
          ),
        ),
              ],
            ),
            
            Expanded(
              //flex: 10,
              child: StatementsListWidget(
                controller: widget.controller,
                //state: widget.state,
              ),
            ),
          ],
        ));
  }
}
