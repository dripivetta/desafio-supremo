import 'package:desafio/models/amount_model.dart';
import 'package:flutter/material.dart';

class AmountWidget extends StatelessWidget {
  const AmountWidget({Key? key, required this.amount}) : super(key: key);

  final Amount amount;

  @override
  Widget build(BuildContext context) {
    //Widget do Amount (Ricardo)
    return Text(amount.amount.toString());
  }
}
