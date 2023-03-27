import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

Future<Question> createQuestion(
  String question,
  String a,
  String b,
  String c,
  String d,
  String answer,
  /* String title */
) async {
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8000/api/question/add'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic /* String */ >{
      //'title': title,
      'question': question,
      'a': a,
      'b': b,
      'c': c,
      'd': d,
      'answer': answer,
    }),
  );

  if (response.statusCode == 200 /* 201 */) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    //200//201//404//400//500//302//
    return Question.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print(response.body);
    print(response.statusCode);
    throw Exception('Failed to create question.');
  }
}

class Question {
  //final int id;
  //final String title;
  final String question;
  final String a;
  final String b;
  final String c;
  final String d;
  final String answer;

  const Question({
    required this.question,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.answer,
  });

  factory Question.fromJson(
      Map<String, dynamic /* String */ /* String  */ /* dynamic */ > json) {
    return Question(
      //id: json['id'],
      //title: json['title'],
      question: json['question'],
      a: json['a'],
      b: json['b'],
      c: json['c'],
      d: json['d'],
      answer: json['answer'],
    );
  }
}

class QuestionInsertScreen extends StatefulWidget {
  const QuestionInsertScreen({super.key});

  @override
  State<QuestionInsertScreen> createState() {
    return _QuestionInsertScreenState();
  }
}

class _QuestionInsertScreenState extends State<QuestionInsertScreen> {
  final TextEditingController _controllerQuestion = TextEditingController();
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  final TextEditingController _controllerC = TextEditingController();
  final TextEditingController _controllerD = TextEditingController();
  final TextEditingController _controllerAnswer = TextEditingController();
  Future<Question>? _futureQuestion;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create a Question',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AddAQuestion'),
          leading: GestureDetector(
            onTap: () => Get.toNamed('/result-screen'),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child:
              (_futureQuestion == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controllerQuestion,
          decoration: const InputDecoration(hintText: 'Enter Question'),
        ),
        TextField(
          controller: _controllerA,
          decoration: const InputDecoration(hintText: 'Enter OptionA'),
        ),
        TextField(
          controller: _controllerB,
          decoration: const InputDecoration(hintText: 'Enter OptionB'),
        ),
        TextField(
          controller: _controllerC,
          decoration: const InputDecoration(hintText: 'Enter OptionC'),
        ),
        TextField(
          controller: _controllerD,
          decoration: const InputDecoration(hintText: 'Enter OptionD'),
        ),
        TextField(
          controller: _controllerAnswer,
          decoration: const InputDecoration(hintText: 'Enter Answer'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureQuestion = createQuestion(
                _controllerQuestion.text,
                _controllerA.text,
                _controllerB.text,
                _controllerC.text,
                _controllerD.text,
                _controllerAnswer.text,
              );
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Question> buildFutureBuilder() {
    return FutureBuilder<Question>(
      future: _futureQuestion!,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.question.toString());
        } else if (snapshot.hasError) {
          if (kDebugMode) {
            print('snapshot: $snapshot');
          }
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
