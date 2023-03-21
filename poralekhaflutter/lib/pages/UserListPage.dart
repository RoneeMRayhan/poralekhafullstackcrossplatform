import 'package:flutter/material.dart';
import 'package:pora_lekha/QuestionScreen/QuestionScreen_page.dart';
import 'package:pora_lekha/pages/home.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<int> mobileNumbers = [1000];

  void getDoc() {
    db.collection('user').get().then((value) {
      for (var doc in value.docs) {
        //mobileNumbers.add('doc["Mobile # "].toString()');
        print(mobileNumbers[0].toString());
        print(doc["Mobile # "]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDoc();
    print(mobileNumbers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Text(names[index]),
              Text(mobileNumbers[0].toString()),
            ],
          );
        },
      ),
    );
  }
}
