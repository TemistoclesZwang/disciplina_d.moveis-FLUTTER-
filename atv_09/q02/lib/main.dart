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
        backgroundColor: Colors.grey.shade900,
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
  void checkAnswer({bool userPickedAnswer}) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (quizBrain.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert,

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
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
            color: Colors.blue,
          ));
        } if (userPickedAnswer != null && userPickedAnswer != correctAnswer) {
          //!
          contar.erro(); //!
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.blue,
          ));
        }
        if (userPickedAnswer == null) {
          scoreKeeper.add(Icon(//!
            Icons.report_gmailerrorred_outlined,
            color: Colors.blue,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
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
          //put color on row
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.green,
                padding: EdgeInsets.all(10.0),
                backgroundColor: Color.fromARGB(255, 16, 44, 14),
              ),
              icon: Icon(Icons.check),
              label: Text('Verdadeiro'),
              onPressed: () {
                checkAnswer(userPickedAnswer: true);
              },
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.orange,
                padding: EdgeInsets.all(10.0),
                backgroundColor: Color.fromARGB(255, 44, 34, 14),

              ),
              icon: Icon(Icons.report_gmailerrorred_outlined),
              label: Text('Talvez'),
              onPressed: () {
                checkAnswer(userPickedAnswer: null);
                contar.duvida(); //!
              },
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.all(10.0),
                backgroundColor: Color.fromARGB(255, 44, 14, 14),

              ),
              icon: Icon(Icons.close),
              label: Text('Falso'),
              onPressed: () {
              checkAnswer(userPickedAnswer: false);

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
