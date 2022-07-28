import 'package:desafio/models/statement_model.dart';
import 'package:desafio/widgets/component/base_colors.dart';
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
    return ListView.builder(
      shrinkWrap: true,
      controller: widget.controller,
      itemCount: widget.statementsList.length,
      itemBuilder: (BuildContext context, int index) {
        return Stack(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: CustomCardStatement(
              statement: widget.statementsList[index],
              idx: index,
            ),
          ),
          Positioned(
            top: 0.0,
            bottom: 0.0,
            left: 25.0,
            child: Container(
              height: double.infinity,
              width: 0.5,
              color: BaseColors().getGreyColor(),
            ),
          ),
          Positioned(
            top: 42.0,
            left: 15.0,
            child: Container(
              margin: EdgeInsets.all(5.0),
              height: 10.0,
              width: 10.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: BaseColors().getGreenColor(),
              ),
            ),
          )
        ]);
      },
    );
  }
}
