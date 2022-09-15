class QuestionAnswer {
  int id;
  bool isVisible;
  bool isAnswer;
  bool isSender;
  String message;
  List<String> answer;

  QuestionAnswer({this.id, this.isAnswer, this.isSender = false, this.isVisible, this.message, this.answer});
}

