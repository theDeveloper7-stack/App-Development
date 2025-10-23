import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSelectAnswer, {super.key});
  final void Function(String ans) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answeredQuestion(String selectedAns) {
    widget.onSelectAnswer(selectedAns);
    setState(() {
      currentQuestionIndex += 1;
    });
    // setState() tells flutter to update the build method
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              // style: TextStyle(
              //   color: const Color.fromARGB(255, 222, 218, 218),
              //   fontSize: 20,
              // ),
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            ...currentQuestion.getShuffledAnswers().map((answers) {
              return AnswerButton(answers, () {
                answeredQuestion(answers);
              });
            }),

            // currentQuestion is a list that contains answers
            // when we call map() function we are telling that
            // for each item in this list do something and return a new list of widgets
            // let if answers has  4 elements then we will get 4 AnswerButtons
            // since we are in the childre of column widget so we can not set a list of widgets inside a list of widgets
            // so the ... spread operator spreads the mapped widgets into the widget tree

            // AnswerButton(currentQuestion.answers[0], () {}),
            // AnswerButton(currentQuestion.answers[1], () {}),
            // AnswerButton(currentQuestion.answers[2], () {}),
            // AnswerButton(currentQuestion.answers[3], () {}),
          ],
        ),
      ),
    );
  }
}
