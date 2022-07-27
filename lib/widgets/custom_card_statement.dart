import 'package:desafio/models/statement_model.dart';
import 'package:desafio/presentation/pages/comprovante_details_page.dart';
import 'package:desafio/widgets/component/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class CustomCardStatement extends StatelessWidget {
  const CustomCardStatement(
      {Key? key, required this.statement, required this.idx})
      : super(key: key);
  final Statement statement;
  final int idx;

  @override
  Widget build(BuildContext context) {
    var nfc = NumberFormat.currency(
      symbol: "R\$",
      locale: "pt_BR",
    );

    // return ListTile(
    //   isThreeLine: true,
    //   title: Text(statement.description),
    //   subtitle: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       statement.bankName != null
    //           ? Text(statement.from!)
    //           : Text(statement.to!),
    //       Text(
    //         nfc.format(statement.amount),
    //         style: TextStyle(
    //             fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
    //       ),
    //     ],
    //   ),
    //   trailing: Text(
    //     DateFormat("dd/MM").format(statement.createdAt),
    //   ),
    //   leading: VerticalDivider(
    //     width: 20,
    //     thickness: 1,
    //     indent: 0,
    //     endIndent: 0,
    //     color: Color.fromARGB(255, 48, 47, 47),
    //   ),
    // );

    return Material(
      child: InkWell(
        onTap: () {
          //Navigator.push(context,
          //MaterialPageRoute(builder: (_) => ComprovanteDetailsPage(id: widget.statement.id), fullscreenDialog: true));
        },
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top:4, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 4),
                        child: Text(
                          statement.description,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      //Spacer(), //ocupar o espaço e jogr o Widget abaixo pro final
                      SizedBox(height: 8),
                      statement.bankName != null
                          ? Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: BaseColors().getGreenColor(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(statement.from!,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: BaseColors().getGreyColor())),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                      DateFormat("dd/MM")
                                          .format(statement.createdAt),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: BaseColors().getBlackColor())),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: BaseColors().getGreenColor(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: Text(
                                    statement.to!,
                                    style: TextStyle(fontSize: 16,color: BaseColors().getGreyColor()),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                    DateFormat("dd/MM")
                                        .format(statement.createdAt),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: BaseColors().getBlackColor())),
                              ],
                            ),

                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          nfc.format(statement.amount),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
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
  if (x == "TRANSFERIN" || x == "TRANSFEROUT" || x == "PIXCASHOUT") {
    isComprovant = false;
  } else if (x == "PIXCASHIN" || x == "BANKSLIPCASHIN") {
    isComprovant = true;
  }

  return isComprovant;
}
