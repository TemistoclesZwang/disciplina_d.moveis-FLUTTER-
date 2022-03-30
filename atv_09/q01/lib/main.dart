import 'dart:async';

import 'package:flutter/material.dart';
//TODO: Step 2 - Import the rFlutter_Alert package here.
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';
import 'contadorAcertos.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  ContadorAcertos contar = ContadorAcertos(); //!

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'Você acertou no total: ${contar.totalAcertos()} questões.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();
        contar.resetAcertos(); //!

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
      

        if (userPickedAnswer == correctAnswer) {
          contar.acerto(); //!

          scoreKeeper.add(Icon(
            Icons.check,
            color: Color.fromARGB(255, 255, 255, 255),
          ));
        } else {
          contar.erro(); //!
          scoreKeeper.add(Icon(
            Icons.close,
            color: Color.fromARGB(255, 104, 104, 104),
          ));
        }
        quizBrain.nextQuestion();
      }
    });
     //!bug a ser resolvido
        Timer(Duration(seconds: 4), () {
          setState(() {
            Alert(
              context: context,
              title: 'Seu tempo acabou!',
              desc: 'Você acertou no total: ${contar.totalAcertos()} questões.',
            ).show();
            contar.erro(); //!
            scoreKeeper.add(Icon(
              Icons.close,
              color: Color.fromARGB(255, 104, 104, 104),
            ));
            quizBrain.nextQuestion();
          });
        });
    //!
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //show timer
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.green,
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.red,
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ],
        ),
        SizedBox(
          height: 100.0,
          // width: double.infinity,
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
