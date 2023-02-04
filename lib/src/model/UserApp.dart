import 'package:flutter/material.dart';

class UserApp {
  String userID, email, fullName, name, age, telNo, role, userImage;

  UserApp(
      {@required this.userID,
      this.email,
      this.fullName,
      this.name,
      this.age,
      this.telNo,
      this.role,
      this.userImage});

//Create Json into FireStore
  factory UserApp.fromJson(Map<String, dynamic> json) {
    return UserApp(
        userID: json['userID'],
        email: json['email'],
        fullName: json['fullName'],
        name: json['name'],
        age: json['age'],
        telNo: json['telNo'],
        role: json['role'],
        userImage: json['userImage']);
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'fullName': fullName,
      'name': name,
      'age': age,
      'telNo': telNo,
      'role': role,
      'userImage': userImage,
    };
  }
}
