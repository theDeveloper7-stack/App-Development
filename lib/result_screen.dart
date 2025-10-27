import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers,this.onRestart, {super.key});

  final List<String> chosenAnswers;

  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': i,
        'questions': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
    // this function returns a list
    // this is type of Map which has key-value pair
    // the String data type is key here and value is Object type that means can be any data type
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQue = questions.length;
    final numCorrectQue = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;

    // where() is a filter function in dart
    // it loops trugh each item in the list and keeps only the ones that meet a certain condition

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answerd $numCorrectQue out of $numTotalQue correctly!',
            style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            QuestionSummary(getSummaryData()),
            SizedBox(height: 30),
            TextButton(onPressed: onRestart, child: Text('Restart',
            style: TextStyle(
              color: Colors.white),
              ),
            style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 33, 150, 243),
                  padding: EdgeInsets.all(10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
