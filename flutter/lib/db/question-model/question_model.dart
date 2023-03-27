class QuestionModel {
  String? question;
  String? a;
  String? b;
  String? c;
  String? d;
  String? answer;

  QuestionModel({
    this.question,
    this.a,
    this.b,
    this.c,
    this.d,
    this.answer,
  });

  QuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    a = json['a'];
    b = json['b'];
    c = json['c'];
    d = json['d'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'a': a,
      'b': b,
      'c': c,
      'd': d,
      'answer': answer
    };
  }
}
