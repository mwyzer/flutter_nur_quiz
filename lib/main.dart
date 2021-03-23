import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Tanggal berapa Miss Nur ulang tahun?',
      'answers': [
        {'text': '8 Desember', 'score': 1},
        {'text': '9 Desember', 'score': 5},
        {'text': '10 Desember', 'score': 3},
        {'text': '11 Desember', 'score': 10},
      ],
    },
    {
      'questionText': 'Apa warna favorit Miss Nur?',
      'answers': [
        {'text': 'Ungu', 'score': 1},
        {'text': 'Merah', 'score': 11},
        {'text': 'Hijau', 'score': 5},
        {'text': 'Pink', 'score': 9},
      ],
    },
    {
      'questionText': 'Miss Nur mengajar mata pelajaran apa?',
      'answers': [
        {'text': 'Bahasa Inggris', 'score': 1},
        {'text': 'Bahasa Indonesia', 'score': 10},
        {'text': 'Basa Sunda', 'score': 5},
        {'text': 'Bahasa Korea', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Kode '),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
