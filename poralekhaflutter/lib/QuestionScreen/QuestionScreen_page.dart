import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pora_lekha/utils/dimensions/Dimensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
List<String> names = ["RMR", "ggg", "yyy"];

class QuestionScreenPage extends StatefulWidget {
  const QuestionScreenPage({super.key});

  @override
  State<QuestionScreenPage> createState() => _QuestionScreenPageState();
}

class _QuestionScreenPageState extends State<QuestionScreenPage> {
  String? groupValue; //no radio button will be selected
  //String gender = "male"; //if you want to set default value
  String answer = "13";
  double marks = 0;
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio Button in Flutter"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: [
          Container(
            height: Dimensions.height20 * 30,
            width: Dimensions.width20 * 30,
            color: Colors.amber,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "9+4=?",
                  style: TextStyle(fontSize: 18),
                ),
                const Divider(),
                RadioListTile(
                  title: const Text("10"),
                  value: "10",
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("13"),
                  value: "13",
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("16"),
                  value: "16",
                  groupValue: groupValue,
                  onChanged: (value) {
                    setState(() {
                      groupValue = value.toString();
                    });
                  },
                ),
                Expanded(
                  child: Container(
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => getData(),
                  child: Center(
                    child: Container(
                      child: const Text("get user"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          /* Container(
            child: SingleChildScrollView(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Text(names[index]);
                  
                },
                
              ),
              
            ),
          ),
          Text(names[0]) */
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submit,
        child: const Icon(Icons.save_alt_outlined),
      ),
    );
  }

  void submit() {
    if (kDebugMode) {
      print(groupValue);
      print(answer);
    }

    if (groupValue == answer) {
      marks++;
    } else {
      marks = marks - 1 / 4;
    }
    if (kDebugMode) {
      print(marks);
    }

    /* await db.collection('user').doc();
    print(nameController.text); */

    /* final user = db.collection('user').doc().snapshots().map((doc) {
      print(doc);
    });
    print(user); */

    /* db.collection("users").add({
      "FirstName": "Ronee",
      "MiddleName": "M",
      "LastName": "Rayhan",
      "DoB": 26061991,
      "Mobile # ": nameController.text,
    }).then(
      (value) => print(value.id),
    ); */

    db.collection("users").add({
      "Name": {"FirstName": "Ronee", "MiddleName": "M", "LastName": "Rayhan"},
      "DoBs": [26061991, 28021989],
      "Mobile # ": nameController.text,
    }).then(
      (DocumentReference value) =>
          print('DocumentSnapshot added with ID: ${value.id}'),
    );
    Get.toNamed('student-list-screen');
  }

  void getData() {
    db.collection("users").get().then((value) {
      for (var doc in value.docs) {
        //print("${doc.id}=>${doc.data}");
        //print(doc.data());
        //print(doc.data().length);
        //print(doc.data().isEmpty);
        //print(doc.data.call());
        //print(doc["Name"]);
        print(doc['Mobile # ']);

        /* if (doc["Name"] != isBlank) {
          print(doc["Name"]["FirstName"]);
        } */
        if (doc["Name"] != null) {
          print(doc["Name"]["LastName"].toString());
          names.add(doc["Name"]["LastName"].toString());
          print(names);
        }
        print(names);
        Get.toNamed('/user-list-page');
      }
    });
    //setState(() {});
  }

  /* final messageRef = db
        .collection("rooms")
        .doc("roomA")
        .collection("messages")
        .doc("message1"); */
}
