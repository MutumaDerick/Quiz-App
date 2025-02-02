import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      final correctAnswer = questions[i].answers[0];
      final isCorrect = chosenAnswers[i] == correctAnswer;

      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'user_answer': chosenAnswers[i],
        'correct_answer': questions[i].answers[0],
        'isCorrect': isCorrect,
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You answered X out of Y questions correctly!'),
              const SizedBox(height: 30),
              QuestionsSummary(summaryData: getSummaryData()),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  //
                },
                child: const Text('Restart Quiz!'),
              )
            ],
          )),
    );
  }
}
