import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(FirstOne());

class FirstOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstOneState();
  }
}

class _FirstOneState extends State<FirstOne> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 8},
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 5},
        {'text': 'Yellow', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Tiger', 'score': 8},
        {'text': 'Zebra', 'score': 6},
        {'text': 'Monkey', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s your favorite Team?',
      'answers': [
        {'text': 'FC Barcelona', 'score': 10},
        {'text': 'Real Madrid', 'score': 2},
        {'text': 'Man City', 'score': 6},
        {'text': 'Man Unnited', 'score': 5},
      ]
    },
    {
      'questionText': 'What\'s your favorite Meal?',
      'answers': [
        {'text': 'Rice', 'score': 3},
        {'text': 'Bread', 'score': 6},
        {'text': 'Fish', 'score': 1},
        {'text': 'Salade', 'score': 10},
      ]
    },
    {
      'questionText': 'What\'s your favorite Drink?',
      'answers': [
        {'text': 'Pepsi', 'score': 10},
        {'text': 'RedBull', 'score': 2},
        {'text': 'Water', 'score': 6},
        {'text': '7uP', 'score': 5},
      ]
    },
    {
      'questionText': 'What\'s your favorite Fruit?',
      'answers': [
        {'text': 'WaterMilon', 'score': 6},
        {'text': 'Apple', 'score': 7},
        {'text': 'Orange', 'score': 5},
        {'text': 'Lemon', 'score': 2},
      ]
    },
  ];
  //questions = [];  doesn't work if the questions is const
  var _questionIndex = 0;
  var _totalScrore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScrore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScrore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We Have More Questions !');
    } else {
      print('No More Questions !');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        //body: Text('This is my default text!'),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScrore, _resetQuiz),
      ),
    );
  }
}
