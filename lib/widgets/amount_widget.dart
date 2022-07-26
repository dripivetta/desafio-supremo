import 'package:desafio/models/amount_model.dart';
import 'package:desafio/widgets/component/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AmountWidget extends StatefulWidget {
  const AmountWidget({Key? key, required this.amount}) : super(key: key);
  final Amount amount;

  @override
  State<AmountWidget> createState() => _AmountWidgetState();
}

class _AmountWidgetState extends State<AmountWidget>
    with AutomaticKeepAliveClientMixin {
  bool _showSaldo = true;

  var nfc = NumberFormat.currency(
    symbol: "R\$",
    locale: "pt_BR",
  );

  @override
  Widget build(BuildContext context) {
    //Widget do Amount (Ricardo)
    //
    //return Text(amount.amount.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: Card(
            shape: RoundedRectangleBorder(),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Seu saldo  ',
                        style: TextStyle(fontSize: 18),
                      ),
                      GestureDetector(
                        child: Icon(
                          _showSaldo == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: BaseColors().getGreenColor(),
                        ),
                        onTap: () {
                          setState(
                            () {
                              _showSaldo = !_showSaldo;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(3)),
                  Row(
                    children: [
                      _showSaldo
                          ? Text(
                              nfc.format(widget.amount.amount),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: BaseColors().getGreenColor(),
                              ),
                            )
                          : Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 12, 4, 4),
                              child: Container(
                                height: 5,
                                width: 150,
                                color: BaseColors().getGreenColor(),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
            //child: Icon(_showSaldo == false
            // ? Icons.visibility_off
            //: Icons.visibility),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            child: Text(
              'Suas movimentações',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
