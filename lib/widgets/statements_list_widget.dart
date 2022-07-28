import 'package:desafio/models/statement_model.dart';
import 'package:desafio/widgets/custom_card_statement.dart';
import 'package:flutter/material.dart';

class StatementsListWidget extends StatefulWidget {
  final List<Statement> statementsList;
  final ScrollController controller;

  const StatementsListWidget({
    Key? key,
    required this.statementsList,
    required this.controller,
  }) : super(key: key);

  @override
  State<StatementsListWidget> createState() => _StatementsListWidgetState();
}

class _StatementsListWidgetState extends State<StatementsListWidget> {
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      controller: widget.controller,
      itemCount: widget.statementsList.length,
      itemBuilder: (BuildContext context, int index) => 
      CustomCardStatement(
        statement: widget.statementsList[index],
        idx: index,
      ),
      separatorBuilder: (_, __) => 
      SizedBox(
        height: 16,
      ),
    );
  }
}
