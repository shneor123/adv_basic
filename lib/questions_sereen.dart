import 'package:first_app/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:first_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSereen extends StatefulWidget {
  const QuestionsSereen({super.key, required this.onSelectdAnswer});

  final void Function(String answer) onSelectdAnswer;

  @override
  State<QuestionsSereen> createState() {
    return _QuestionsSereenState();
  }
}

class _QuestionsSereenState extends State<QuestionsSereen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectdAnswer) {
    widget.onSelectdAnswer(
      '...',
    );
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currQuestions = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currQuestions.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currQuestions.getShuffledAnswers().map((answer) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    }))),
          ],
        ),
      ),
    );
  }
}
