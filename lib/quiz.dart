import 'package:flutter/material.dart';
import 'package:quizzler/container.dart';
import 'package:quizzler/data/questions.dart';
import 'package:quizzler/questions_screen.dart';
import 'package:quizzler/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //METHOD 1 STARTS

  // Widget? active_screen;

  // @override
  // void initState() {
  //   active_screen = StartScreen(switchscreen);
  //   super.initState();
  // }

  // void switchscreen() {
  //   setState(() {
  //     active_screen = const QuestionScreen();
  //   });
  // }
  //                        METHOD 1 ENDS

  // METHOD 2 STARTS
  var active_screen = "start-screen";
  void switchscreen() {
    setState(() {
      active_screen = "questions-screen";
    });
  }

  List<String> selectedAnswers = [];
  void chooseanswer(String answers) {
    selectedAnswers.add(answers);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        active_screen = "result-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchscreen);

    if (active_screen == "questions-screen") {
      screenWidget = QuestionScreen(chooseanswer);
    }
    
    if (active_screen == "result-screen") {
      screenWidget = ResultScreen(selectedAnswers);
    }


    //METHOD 2 ENDS

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.blue.shade600),
          child: screenWidget,
        ),
      ),
    );
  }
}
