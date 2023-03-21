class QuestionModel {
  QuestionModel({
    //this.id,
    required this.question,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.answer,
    this.createdAt,
    this.updatedAt,
  });

  QuestionModel.fromJson(dynamic json) {
    //id = json['id'];
    //id = json['id'].toString();
    //id = json['id'] as String;
    //id = json['id'];
    //question = json['question'];
    question = json['question'] as String;
    a = json['A'] as String;
    b = json['B'] as String;
    c = json['C'] as String;
    d = json['D'] as String;
    answer = json['Answer'] as String;
    createdAt = json['created_at'] as String;
    updatedAt = json['updated_at'] as String;
  }
  //int? id;
  String? id;
  String? question;
  String? a;
  String? b;
  String? c;
  String? d;
  String? answer;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    //map['id'] = id;
    //map['id'] = id as String;
    map['question'] = question;
    map['A'] = a;
    map['B'] = b;
    map['C'] = c;
    map['D'] = d;
    map['Answer'] = answer;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
