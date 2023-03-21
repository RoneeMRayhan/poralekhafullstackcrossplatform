import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pora_lekha/controllers/student_controller.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  StudentController studentController = StudentController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        initialData: const [],
        future: studentController.getAllStudents(),
        builder: (context, snapshot) => ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(
                snapshot.data![index]['studentname'],
              ),
              subtitle: Text(snapshot.data![index]['email']),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "Go to Home",
          onPressed: () {
            Get.toNamed('/home');
          },
          child: const Icon(Icons.home_filled)),
    );
  }
}
