import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  var resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 20) {
      resultText = 'You are .... strange?!';
    } else if (resultScore <= 26) {
      resultText = 'You are so bad!';
    } else if (resultScore <= 30) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 45) {
      resultText = 'You are awesome!';
    } else {
      resultText = 'Wow .... You are Superstar!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            textColor: Colors.red,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
