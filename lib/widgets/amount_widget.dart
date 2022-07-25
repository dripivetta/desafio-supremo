import 'package:desafio/models/amount_model.dart';
import 'package:desafio/widgets/component/base_colors.dart';
import 'package:flutter/material.dart';

class AmountWidget extends StatefulWidget {
  const AmountWidget({Key? key, required this.amount}) : super(key: key);
  final Amount amount;

  @override
  State<AmountWidget> createState() => _AmountWidgetState();
}

class _AmountWidgetState extends State<AmountWidget> {
  bool _showSaldo = false;

  @override
  Widget build(BuildContext context) {
    //Widget do Amount (Ricardo)
    //
    //return Text(amount.amount.toString());
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Seu saldo  ',
                            style: TextStyle(fontSize: 20),
                          ),
                          GestureDetector(
                            child: Icon(
                              _showSaldo == false
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: BaseColors().getGreenColor(),
                            ),
                            onTap: () {
                              setState(() {
                                _showSaldo = !_showSaldo;
                              });
                            },
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(4)),
                      Row(                        
                        children: [     
                          Text(                           
                            widget.amount.amount.toString(),
                            style: TextStyle(
                              fontSize: 20,
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
        ),
      );
  }
}
