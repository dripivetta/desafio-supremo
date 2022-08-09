import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  
  final String label;
  final Function()? onPressed;

  final buttonStyle = ElevatedButton.styleFrom(
    textStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    padding: const EdgeInsets.all(18),
  );

  CustomButton(
      {Key? key, required this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: buttonStyle,
        child: Text(          
          'Compartilhar',
        ),
        onPressed: () {},
      ),
    );
  }
}
