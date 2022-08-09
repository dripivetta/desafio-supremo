import 'dart:io';
import 'dart:typed_data';
import 'package:desafio/domain/entities/detailStatement.dart';
import 'package:desafio/widgets/component/base_appbar_pages/custom_app_bar.dart';
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import '../../../widgets/component/comprovante_details_page/custom_button_compartilhar.dart';
import '../../../widgets/component/comprovante_details_page/custom_divider.dart';
import '../../../widgets/component/comprovante_details_page/custom_row.dart';

class ComprovantePage extends StatefulWidget {
  const ComprovantePage({Key? key, required this.value}) : super(key: key);

  final DetStatement value;

  @override
  State<ComprovantePage> createState() => _ComprovantePageState();
}

class _ComprovantePageState extends State<ComprovantePage> {
  final controller = ScreenshotController();
  final bool _isLoading = false;

  final nfc = NumberFormat.currency(
    symbol: "R\$",
    locale: "pt_BR",
  );

  @override
  void initState() {
    super.initState();
  }

  Future saveAndShare(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.jpeg');
    image.writeAsBytesSync(bytes);

    await Share.shareFiles([image.path]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: CustomAppBar(
            navigator: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_arrow_left),
            iconSize: 35,
            colorIcon: BaseColors().getBlackColor(),
            elevationApp: 0,
            backgroundColorApp: Colors.transparent,
            scrolledUnderElevationApp: 0,
          )),
      body: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 10),
        child: SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildImage(),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomButtonCompartilhar(
                  titulo: 'Compartilhar',
                  fontSize: 18,
                  printScreen: () async {
                    var image =
                        await controller.captureFromWidget(buildImage());
                    saveAndShare(image);
                  },
                  isLoading: _isLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage() => Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRow(
                  cabecalho: 'Comprovante',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 2),
                CustomDivider(),
                const SizedBox(height: 15),
                CustomRow(
                  cabecalho: 'Tipo de movimentação',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 3),
                CustomRow(
                    cabecalho: widget.value.description,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
                const SizedBox(height: 15),
                CustomRow(
                    cabecalho: 'Valor',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 3),
                CustomRow(
                    cabecalho: nfc.format(widget.value.amount),
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
                const SizedBox(height: 15),
                CustomRow(
                    cabecalho: 'Recebedor',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 3),
                widget.value.to != null
                    ? CustomRow(
                        cabecalho: widget.value.to!,
                        fontSize: 20,
                        fontWeight: FontWeight.normal)
                    : CustomRow(
                        cabecalho: widget.value.from!,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                const SizedBox(height: 15),
                CustomRow(
                    cabecalho: 'Instituição Bancária',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 3),
                CustomRow(
                    cabecalho: widget.value.tType,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
                const SizedBox(height: 15),
                CustomRow(
                    cabecalho: 'Data/Hora',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 5),
                CustomRow(
                    cabecalho: DateFormat('dd/MM/yyyy - hh:mm')
                        .format(widget.value.createdAt),
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
                const SizedBox(height: 15),
                CustomRow(
                    cabecalho: 'Autenticação',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                const SizedBox(height: 5),
                CustomRow(
                    cabecalho: widget.value.authentication,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
                const SizedBox(height: 50),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      );
}
