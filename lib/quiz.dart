import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/start_screen.dart';

var startColor = const Color.fromARGB(255, 55, 5, 139);
var endColor = Color.fromARGB(255, 108, 6, 192);

var startPoint = AlignmentGeometry.topLeft;
var endPoint = AlignmentGeometry.bottomRight;

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [startColor, endColor],
              begin: startPoint,
              end: endPoint,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
