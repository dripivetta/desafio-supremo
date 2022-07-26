import 'package:desafio/models/statement_model.dart';
import 'package:flutter/material.dart';

class StatementsListWidget extends StatefulWidget {
  final List<Statement> statements;
  final dynamic controller;

  const StatementsListWidget(
      {Key? key,
      required this.statements, this.controller,
      //required this.controller,
      })
      : super(key: key);

  @override
  State<StatementsListWidget> createState() => _StatementsListWidgetState();
}

class _StatementsListWidgetState extends State<StatementsListWidget> {
  @override
  Widget build(BuildContext context) {
    //Aqui vai lista (Igor)
    return ListView.builder(
      shrinkWrap: true,
      controller: widget.controller,
      itemCount: widget.statements.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        title: Text(widget.statements[index].description),
        subtitle: Text(widget.statements[index].to!),
        trailing: Text(widget.statements[index].amount.toString()),
      ),
    );
  }
}
