class QuizModel {
  int? responseCode;
  List<Results>? results;

  QuizModel({this.responseCode, this.results});

  QuizModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['response_code'] = responseCode;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? type;
  String? difficulty;
  String? category;
  String? question;
  String? correctAnswer;
  List<String>? incorrectAnswers;

  Results(
      {this.type,
      this.difficulty,
      this.category,
      this.question,
      this.correctAnswer,
      this.incorrectAnswers});

  Results.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    difficulty = json['difficulty'];
    category = json['category'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    incorrectAnswers = json['incorrect_answers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['difficulty'] = difficulty;
    data['category'] = category;
    data['question'] = question;
    data['correct_answer'] = correctAnswer;
    data['incorrect_answers'] = incorrectAnswers;
    return data;
  }
}
