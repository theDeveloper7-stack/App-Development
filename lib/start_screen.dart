import 'package:flutter/material.dart';
// import 'package:quiz_app/question_screen.dart';

var targetImage = 'assets/assets/images/quiz-logo.png';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.8,
          //   child: Image.asset(
          //     targetImage,
          //     width: 300,
          //     ),
          // ),
          Image.asset(targetImage, width: 300, color: Colors.blueAccent),
          SizedBox(height: 40),
          Text(
            'Learn Flutter the fun way',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 40),
          OutlinedButton(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 220, 227, 235),
            ),
            child: Text(
              'Start Quiz',
              style: TextStyle(color: Colors.blueAccent, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
