import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:flutter/material.dart';

class AcaoIcon extends StatelessWidget {
  final IconData icon;
  final String name;
  final bool? isFirst;

  const AcaoIcon({
    Key? key,
    required this.icon,
    required this.name,
    this.isFirst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: isFirst != null && isFirst!
          ? const EdgeInsets.only(left: 20, right: 6)
          : const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: BaseColors().getGreyLigthColor(),
            ),
            child: Icon(icon),
          ),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
