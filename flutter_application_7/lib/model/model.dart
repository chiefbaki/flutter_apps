class JokeModel {
  String? value;

  JokeModel({this.value});

  JokeModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }
}
