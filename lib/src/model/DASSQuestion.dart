import 'package:flutter/material.dart';

class Question {
  String text;
  String type; //ANXIETY, STRESS, DEPRESSION
  int score;
  Question({this.text, this.type, this.score = 0});
}

class Answer {
  final String text;
  final int value; // 0-3
  const Answer({@required this.text, @required this.value});
}

class DASSQuestion {
  String dassQuestionID;
  String userID;
  int stress;
  String stressDesc;
  int anxiety;
  String anxietyDesc;
  int depression;
  String depreDesc;
  String currentDateTime;

  DASSQuestion({
    this.dassQuestionID,
    @required this.userID,
    this.stress,
    this.stressDesc,
    this.anxiety,
    this.anxietyDesc,
    this.depression,
    this.depreDesc,
    this.currentDateTime,
  });

//Create Json into FireStore
  factory DASSQuestion.fromJson(Map<String, dynamic> json) {
    return DASSQuestion(
      dassQuestionID: json['dassQuestionID'],
      userID: json['UserID'],
      stress: json['stress'],
      stressDesc: json['stressDesc'],
      anxiety: json['anxiety'],
      anxietyDesc: json['anxietyDesc'],
      depression: json['depression'],
      depreDesc: json['depreDesc'],
      currentDateTime: json['currentDateTime'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dassQuestionID': dassQuestionID,
      'userID': userID,
      'stress': stress,
      'stressDesc': stressDesc,
      'anxiety': anxiety,
      'anxietyDesc': anxietyDesc,
      'depression': depression,
      'depreDesc': depreDesc,
      'currentDateTime': currentDateTime,
    };
  }
}
