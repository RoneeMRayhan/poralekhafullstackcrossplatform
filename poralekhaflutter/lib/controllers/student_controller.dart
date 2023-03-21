import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class StudentController {
  Future<List> getAllStudents() async {
    //String baseUrl = "https://poralekha.prosolver.org/poralekha/api/student";
    String baseUrl = "http://127.0.0.1:8000/api/students";

    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        if (kDebugMode) {
          print('ServerError');
        }
        return Future.error("Server Error");
      }
    } catch (e) {
      if (kDebugMode) {
        print('catch');
      }
      return Future.error(e);
    }
  }
}
