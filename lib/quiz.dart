import 'package:first_app/data/questions.dart';
import 'package:first_app/questions_sereen.dart';
import 'package:first_app/results_screen.dart';
import 'package:first_app/start_screen.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomLeft;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectdAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-sereen';
    });
  }

  // Widget? activeScreen;@override
  //   void initState() {activeScreen = StartScreen(switchScreen);super.initState();}
  //   void switchScreen() {setState(() { activeScreen = const QuestionsSereen();});}

  void chooseAnswer(String answer) {
    selectdAnswer.add(answer);

    if (selectdAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-sereen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectdAnswer = [];
      activeScreen = 'questions-sereen';
    });
  }

  @override
  Widget build(context) {
    // final screenWidget = activeScreen == 'start-screen' ? StartScreen(switchScreen): const QuestionsSereen();
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-sereen') {
      screenWidget = QuestionsSereen(onSelectdAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-sereen') {
      screenWidget = ResulusScreen(
        chosenAnswers: selectdAnswer,
        onRestart: restartQuiz,);
    }

    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(198, 30, 4, 59),
              Color.fromARGB(255, 78, 13, 151),
            ],
            begin: startAlignment,
            end: endAlignment,
          ),
        ),
        child: screenWidget,
        // child: activeScreen,
      )),
    );
  }
}
