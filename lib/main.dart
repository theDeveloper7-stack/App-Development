import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
// import 'package:quiz_app/start_screen.dart';

// var startColor = const Color.fromARGB(255, 55, 5, 139);
// var endColor= Color.fromARGB(255, 108, 6, 192);

// var startPoint = AlignmentGeometry.topLeft;
// var endPoint = AlignmentGeometry.bottomRight;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Quiz();
  }
}

void main() {
  runApp(MyApp());
}
