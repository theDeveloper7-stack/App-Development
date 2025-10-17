import 'package:flutter/material.dart';

class textWidget extends StatelessWidget {
  // textWidget(String text, {super.key}) : printText = text;

  final String printText;
  // Since we are not pre-assigning the varaible
  // at compile time so we can use final keyword
  // that means it only can be assigned once at run-time.

  const textWidget(this.printText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      //'hello world', // Here the text should be dynamic
      printText,
      style: TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}
