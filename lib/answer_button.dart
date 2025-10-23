import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final Function() onTap;
  const AnswerButton(this.answerText,this.onTap,{super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20
        ),
        backgroundColor: const Color.fromARGB(255, 18, 45, 92),
        foregroundColor: Colors.white70,
      ),
      child: Text(answerText,
      textAlign: TextAlign.center,
      ),
    );
  }
}
