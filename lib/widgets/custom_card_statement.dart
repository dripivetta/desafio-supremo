import 'package:desafio/domain/entities/statement.dart';
import 'package:desafio/presentation/pages/comprovante/comprovante_details_page.dart';
import 'package:desafio/widgets/component/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCardStatement extends StatelessWidget {
  const CustomCardStatement(
      {Key? key, required this.statement, required this.idx})
      : super(key: key);
  final Statement statement;
  final int idx;

  @override
  Widget build(BuildContext context) {
    final nfc = NumberFormat.currency(
      symbol: "R\$",
      locale: "pt_BR",
    );

    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ComprovanteDetailsPage(id: statement.id),
                  fullscreenDialog: true));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 6),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: isPix(statement.tType)
                ? BoxDecoration(
                    color: BaseColors().getWhiteColor(),
                  )
                : BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6, left: 30, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              statement.description,
                              style: TextStyle(
                                  fontFamily: 'Khalid',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                            Spacer(),
                            isPix(statement.tType)
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: BaseColors().getGreenColor(),
                                    ),
                                    width: 50,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        'Pix',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: BaseColors().getWhiteColor(),
                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        //Spacer(), //ocupar o espaço e jogr o Widget abaixo pro final
                        SizedBox(height: 6),
                        statement.bankName != null
                            ? Row(
                                children: [
                                  Text(
                                    statement.from!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: BaseColors().getGreyColor(),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                      DateFormat("dd/MM")
                                          .format(statement.createdAt),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: BaseColors().getGreyColor())),
                                ],
                              )
                            : Row(
                                children: [
                                  Text(
                                    statement.to!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: BaseColors().getGreyColor()),
                                  ),
                                  Spacer(),
                                  Text(
                                      DateFormat("dd/MM")
                                          .format(statement.createdAt),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: BaseColors().getGreyColor())),
                                ],
                              ),

                        const SizedBox(height: 10),
                        isComprovant(statement.tType)
                            ? Text(
                                '-${nfc.format(statement.amount)}',
                                style: TextStyle(
                                    fontFamily: 'Khalid',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16),
                              )
                            : Text(
                                nfc.format(statement.amount),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

isComprovant(x) {
  bool isComprovant = false;
  if (x == "TRANSFEROUT" || x == "PIXCASHOUT") {
    isComprovant = true; //trans realizada
  } else if (x == "PIXCASHIN" || x == "BANKSLIPCASHIN" || x == "TRANSFERIN") {
    isComprovant = false;
  }

  return isComprovant;
}

isPix(x) {
  bool isComprovant = false;
  if (x == "TRANSFERIN" || x == "TRANSFEROUT" || x == "BANKSLIPCASHIN") {
    isComprovant = false;
  } else if (x == "PIXCASHIN" || x == "PIXCASHOUT") {
    isComprovant = true;
  }

  return isComprovant;
}
