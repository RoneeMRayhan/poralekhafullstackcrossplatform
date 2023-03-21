import 'package:flutter/material.dart';
import 'package:pora_lekha/controllers/question_controller.dart';
import 'package:pora_lekha/pages/result/index.dart';
import '../models/question_model2.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<String> questionVal = [];
  List<String> groupVal = [];
  List<String> answerVal = [];
  QuestionController questionController = QuestionController();

  @override
  void initState() {
    super.initState();
    questionController.getAllQuestions().then((value) {
      for (var element in value) {
        questionVal.add(element['question']);
      }
    });
    questionController.getAllQuestions().then((value) {
      for (var element in value) {
        groupVal.add(element['question']);
      }
    });
    questionController.getAllQuestions().then((value) {
      for (var element in value) {
        answerVal.add(element['Answer']);
      }
    });
    //questionVal = groupVal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        initialData: const [],
        future: questionController.getAllQuestions(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    clipBehavior: Clip.hardEdge,
                    //color: Colors.grey,
                    //color: const Color.fromARGB(103, 013, 130, 310),
                    //color: const Color.fromRGBO(013, 130, 301, 031),
                    //color: Color(0xAACCDDBB),
                    //color: Color(hashCode),
                    //color: Color.fromARGB(a, r, g, b),
                    //color: Color(0xFFaabbcc),
                    //color: Color(0xFFAA00BB),
                    //color: Colors.greenAccent,
                    //color: const Color(0xFF42A5F5),
                    //color: const Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
                    //color: const Color.fromARGB(255, 66, 15, 13),
                    //color: const Color.fromRGBO(66, 165, 213, 013),
                    //color: const Color(0xFFFFFF), //; // fully,
                    //color: const Color(0xFFFFFFFF), //; // full,
                    //color: const Color.fromRGBO(66, 165, 213, 013),
                    color: const Color(0xFF00CC00),

                    child: Container(
                      //color: Colors.limeAccent[400], //Colors.amber,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "(${snapshot.data![index]['id']})       "
                            "${snapshot.data![index]['question']}",
                            style: const TextStyle(fontSize: 18),
                          ),
                          const Divider(),
                          RadioListTile(
                            title: Text(
                              snapshot.data![index]['A'],
                            ),
                            value: snapshot.data![index]['A'],
                            groupValue: groupVal[index],
                            onChanged: (value) {
                              setState(() {
                                groupVal[index] = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(
                              snapshot.data![index]['B'],
                            ),
                            value: snapshot.data![index]['B'],
                            groupValue: groupVal[index],
                            onChanged: (value) {
                              setState(() {
                                groupVal[index] = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(
                              snapshot.data![index]['C'],
                            ),
                            value: snapshot.data![index]['C'],
                            groupValue: groupVal[index],
                            onChanged: (value) {
                              setState(() {
                                groupVal[index] = value;
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(
                              snapshot.data![index]['D'],
                            ),
                            value: snapshot.data![index]['D'],
                            groupValue: groupVal[index],
                            onChanged: (value) {
                              setState(() {
                                groupVal[index] = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Go to Result Screen",
        onPressed: () {
          double mark = 0.0;
          print(questionVal);
          print(groupVal);
          print(answerVal);

          for (int i = 0; i < groupVal.length; i++) {
            if (groupVal[i] == answerVal[i]) {
              mark++;
            } else if (groupVal[i] == questionVal[i]) {
              mark = mark;
            } else {
              mark = mark - 1 / 4;
            }
          }
          print(mark);

          ResultState.mark = RxDouble(mark);
          ResultState.groupValues = groupVal;

          //Get.toNamed('/result-screen');
          Get.toNamed('/question-insert-screen');
        },
        child: const Icon(Icons.home_filled),
      ),
    );
  }
}
