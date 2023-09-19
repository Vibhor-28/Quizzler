import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen( this.switchscreen ,{super.key});
  
  final void Function() switchscreen;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            height: 350,
            color: const Color.fromARGB(180, 255, 255, 255),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              "Welcome to Quiz App",
              style: GoogleFonts.lato(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton.icon(
              onPressed: switchscreen,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              icon: const Icon(Icons.arrow_right_alt_sharp),
              label: const Text(
                "Start Quiz",
              ))
        ],
      ),
    );
  }
}
