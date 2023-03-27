import 'dart:convert';

import 'package:collection/collection.dart';

class Question {
  final String? question;
  final String? a;
  final String? b;
  final String? c;
  final String? d;
  final String? e;
  final String? answer;

  const Question({
    this.question,
    this.a,
    this.b,
    this.c,
    this.d,
    this.e,
    this.answer,
  });

  @override
  String toString() {
    return 'Question(question: $question, a: $a, b: $b, c: $c, d: $d, e: $e, answer: $answer)';
  }

  factory Question.fromMap(Map<String, dynamic> data) => Question(
        question: data['Question'] as String?,
        a: data['A'] as String?,
        b: data['B'] as String?,
        c: data['C'] as String?,
        d: data['D'] as String?,
        e: data['E'] as String?,
        answer: data['Answer'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Question': question,
        'A': a,
        'B': b,
        'C': c,
        'D': d,
        'E': e,
        'Answer': answer,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Question].
  factory Question.fromJson(String data) {
    return Question.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Question] to a JSON string.
  String toJson() => json.encode(toMap());

  Question copyWith({
    String? question,
    String? a,
    String? b,
    String? c,
    String? d,
    String? e,
    String? answer,
  }) {
    return Question(
      question: question ?? this.question,
      a: a ?? this.a,
      b: b ?? this.b,
      c: c ?? this.c,
      d: d ?? this.d,
      e: e ?? this.e,
      answer: answer ?? this.answer,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Question) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      question.hashCode ^
      a.hashCode ^
      b.hashCode ^
      c.hashCode ^
      d.hashCode ^
      e.hashCode ^
      answer.hashCode;
}
