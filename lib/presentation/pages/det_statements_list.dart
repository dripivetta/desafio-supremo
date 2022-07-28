import 'package:desafio/models/detail_statement_model.dart';
import 'package:flutter/cupertino.dart';

class DetStatementsList extends StatelessWidget {
  const DetStatementsList({
    Key? key,
    required this.detStatement,
    required Text leading
  }) : super(key: key);

  final DetStatement detStatement;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(detStatement.description),
        Text(detStatement.authentication),
        Text(detStatement.id),
        Text(detStatement.amount.toString()),
        Text(detStatement.createdAt),
      ],
    );
  }
}
