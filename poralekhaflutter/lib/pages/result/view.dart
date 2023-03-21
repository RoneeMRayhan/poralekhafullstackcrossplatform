import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pora_lekha/pages/result/index.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Result: You have got (${ResultState.mark} out of ${ResultState.groupValues.length}) mark(s). \n Try again...",
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => Get.toNamed('/question-screen'),
                  child: Container(
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: const Text('Sit for Exam'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
