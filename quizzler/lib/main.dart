import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizzler',
      home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: QuizPage()),
          )),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var scoreKeeper = <Icon>[];

  void checkAnswer(bool userAnswer) {
    return setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz',
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      } else {
        scoreKeeper.add(quizBrain.getQuestionAnswer() == userAnswer
            ? Icon(
                Icons.check,
                color: Colors.green,
              )
            : Icon(Icons.close, color: Colors.red));
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
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: SizedBox(
                  height: double.infinity,
                  // True button
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Text(
                      'True',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => {checkAnswer(true)},
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: SizedBox(
                  height: double.infinity,
                  // False Button
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: Text(
                      'False',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => {checkAnswer(false)},
                  ),
                ),
              ),
            )
          ]),
        ),
        Wrap(
          children: scoreKeeper,
        )
      ],
    );
  }
}
