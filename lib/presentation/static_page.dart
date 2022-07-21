import 'package:desafio/widgets/component/base_colors.dart';
import 'package:flutter/material.dart';

class StaticPage extends StatelessWidget {
  StaticPage({Key? key}) : super(key: key);

  bool _showSaldo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Extrato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                //height: 100,
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
                                setState() {
                                  _showSaldo = !_showSaldo;
                                }
                              },
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(4)),
                        Row(
                          children: [
                            Text(
                              'RS 1345,00',
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
            Expanded(
              flex: 10,
              child: SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: ((__, _) {
                    return ListTile(
                      title: Text('Transferência enviada'),
                      trailing: Text('10'),
                      subtitle: Text('Conta'),
                    );
                  }),
                  separatorBuilder: (__, _) => const Divider(),
                  itemCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
