import 'package:flutter/material.dart';
// import 'package:quiz_app/data/questions.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData,{super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
              children: summaryData.map((data)
              // map() function iterates through each item in summaryData
              // for every data it returns a widget (here the Row widget)
              {
                return Row(
                  children: [
                    Text(((data['question_index'] as int) + 1).toString(),
                          style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                    // (data['question_index'] as int) this is how we typecast in dart
                    Expanded(
                      // without Expanded the content inside Row grows on its own
                      // but with Expanded it will take as much width as the contents needed
                      child: Column(
                        children: [
                          Text(data['questions'] as String,
                            style: TextStyle(
                              color: Colors.white,
                              ),
                          ),
                          SizedBox(height: 5,),
                          Text(data['user_answer'] as String,
                            style: TextStyle(
                              color: Colors.white,
                                ),
                              ),
                          Text(data['correct_answer'] as String,
                              style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ).toList(),
            // since children require list of widget or basically a list
            //so toList() function converts all those things to list
        ),
      ),
    );
  }
}
