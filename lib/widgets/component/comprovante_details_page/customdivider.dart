import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 15,
      thickness: 1.2,
      color: Colors.black,
      // endIndent: 100,
    );
  }
}
