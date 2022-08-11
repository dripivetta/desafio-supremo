import 'package:desafio/presentation/bloc/amount/amount_bloc.dart';
import 'package:desafio/presentation/bloc/amount/amount_event.dart';
import 'package:desafio/presentation/bloc/amount/amount_state.dart';
import 'package:desafio/presentation/injection.dart';
import 'package:desafio/presentation/widgets/component/base_color_pages/base_colors.dart';
import 'package:desafio/presentation/widgets/component/home_page/conta_saldo.dart';
import 'package:desafio/presentation/widgets/component/home_page/conta_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ContaArea extends StatelessWidget {
  const ContaArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nfc = NumberFormat.currency(
      symbol: "R\$",
      locale: "pt_BR",
    );

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContaText(
            mainAxisRow: MainAxisAlignment.spaceBetween,
            text: 'Conta',
            fontSizeText: 20,
            colorText: BaseColors().getBlackColor(),
          ),
          BlocBuilder(
            bloc: getIt.get<AmountBloc>()
              ..add(
                FetchAmount(),
              ),
            builder: (context, state) {
              if (state is AmountHasData) {
                return ContaSaldo(
                  marginContainer: EdgeInsets.only(top: 10),
                  mainAxixRow: MainAxisAlignment.spaceBetween,
                  text: nfc.format(state.result.amount),
                  fontSizeText: 20,
                  fontWeightText: FontWeight.bold,
                );

                //  _showSaldo
                //     ? Text(
                //         nfc.format(state.result.amount),
                //         style: TextStyle(
                //           fontSize: 24,
                //           fontWeight: FontWeight.bold,
                //           color: BaseColors().getGreenColor(),
                //         ),
                //       )
                //     : Padding(
                //         padding: EdgeInsetsDirectional.fromSTEB(
                //             1, 12, 4, 4),
                //         child: Container(
                //           height: 6,
                //           //MediaQuery.of(context).size.height * 0.006,
                //           width: MediaQuery.of(context).size.width * 0.38,
                //           color: BaseColors().getGreenColor(),
                //         ),
                //       );
              } else if (state is AmountIsError) {
                return const Center(
                  child: Text('Error'),
                );
              } else {
                return const Center(
                  child: Text(''),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
