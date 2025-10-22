import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: TextStyle(
              color: const Color.fromARGB(255, 222, 218, 218),
              fontSize: 25,
            ),
          ),
          SizedBox(height: 30),
          AnswerButton(currentQuestion.answers[0], () {}),
          AnswerButton(currentQuestion.answers[1], () {}),
          AnswerButton(currentQuestion.answers[2], () {}),
          AnswerButton(currentQuestion.answers[3], () {}),
        ],
      ),
    );
  }
}
