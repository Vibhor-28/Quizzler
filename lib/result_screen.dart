import 'package:flutter/material.dart';
import 'package:quizzler/data/questions.dart';
import 'package:quizzler/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers, {super.key});
  final List<String> chosenAnswers;

  List<Map<String, Object>> getsummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "questionindex": i,
        "question": questions[i].text,
        "correct-answer": questions[i].answers[0],
        "user-answer": chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summary = getsummaryData();
    final totalquestions = questions.length;
    final totalcorrectquestions = summary.where((element) {
      return element["correct-answer"] == element["user-answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $totalcorrectquestions out of $totalquestions questions"),
            const SizedBox(height: 20),
            QuestionSummary(summary),
             const  SizedBox(height: 20),
            TextButton(onPressed: () {}, child: const Text("restart"))
          ],
        ),
      ),
    );
  }
}
