import 'package:flutter/material.dart';
import 'package:quizzler/answer_button.dart';
import 'package:quizzler/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSelectedAnswer, {super.key});
  final void Function(String Answer) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionscreenState();
  }
}

class _QuestionscreenState extends State<QuestionScreen> {
  var currentQuestionindex = 0;
  void AnswerQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionindex];
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
              style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getshuffledanswers().map(
                  (item) => AnswerButton(
                    item,
                    () {
                      AnswerQuestion(item);
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
