import 'package:desafio/models/statement_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatementsListWidget extends StatefulWidget {
  final List<Statement> statementsList;
  final ScrollController controller;

  const StatementsListWidget({
    Key? key,
    required this.statementsList,
    required this.controller,
    //required this.controller,
  }) : super(key: key);

  @override
  State<StatementsListWidget> createState() => _StatementsListWidgetState();
}

class _StatementsListWidgetState extends State<StatementsListWidget> {
  var nfc = NumberFormat.currency(
    symbol: "R\$",
    locale: "pt_BR",
  );

  final bool _isPix = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      controller: widget.controller,
      itemCount: widget.statementsList.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        isThreeLine: true,
        title: Text(widget.statementsList[index].description),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             widget.statementsList[index].bankName != null
                 ? Text(widget.statementsList[index].from!)
                 : Text(widget.statementsList[index].to!),
            Text(
              nfc.format(widget.statementsList[index].amount),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16),
            ),
          ],
        ),
        trailing: Text(
          DateFormat("dd/MM").format(widget.statementsList[index].createdAt),
        ),
        leading: VerticalDivider(
          width: 20,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: Color.fromARGB(255, 48, 47, 47),
        ),
      ),
    );
  }
}

isComprovant(x) {
  bool isComprovant = false;
  if ( x == "TRANSFEROUT"|| x == "PIXCASHOUT" ) {
    isComprovant = true; //trans realizada
  } else if (x == "PIXCASHIN" || x == "BANKSLIPCASHIN" || x == "TRANSFERIN" ) {
    isComprovant = false;
  }

  return isComprovant;
}

isPix(x) {
  bool isComprovant = false;
  if (x == "TRANSFERIN" || x == "TRANSFEROUT"|| x == "PIXCASHOUT" ) {
    isComprovant = false;
  } else if (x == "PIXCASHIN" || x == "BANKSLIPCASHIN") {
    isComprovant = true;
  }

  return isComprovant;
}
