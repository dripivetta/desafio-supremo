import 'package:desafio/models/statement_model.dart';
import 'package:flutter/material.dart';

class StatementsListWidget extends StatelessWidget {
  final List<Statement> statements;

  const StatementsListWidget({Key? key, required this.statements})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Aqui vai lista (Igor)
    return ListView.builder(
      shrinkWrap: true,
      itemCount: statements.length,
      itemBuilder: (BuildContext context, int index) => Column(
        children: [Text(statements[index].description)],
      ),
    );
  }
}
