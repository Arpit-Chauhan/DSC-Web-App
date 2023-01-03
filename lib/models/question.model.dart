class QuestionModel {
  String domain;
  bool isMCQ;
  String question;
  String code;
  List<String> options;
  String correctOption;
  String userMarkedOption;
  QuestionModel(
    this.domain,
    this.isMCQ,
    this.question,
    this.code,
    this.options,
    this.correctOption,
    this.userMarkedOption,
  );

  toJson() {
    return {
      'domain': this.domain,
      'type': isMCQ ? 'Objective' : 'Subjective',
      "question": this.question,
      "code": this.code,
      "correctOption": this.correctOption,
      "userMarkedOption": this.userMarkedOption,
    };
  }

  toSecureJson() {
    return {
      'domain': this.domain,
      'type': isMCQ ? 'Objective' : 'Subjective',
      "question": this.question,
      "code": this.code,
      "userMarkedOption": this.userMarkedOption,
    };
  }
}
