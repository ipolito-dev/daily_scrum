import 'dart:convert';

import 'package:daily_scrum/domain/entities/logged_user_entity.dart';

class LoggedUserModel extends LoggedUserEntity {
  LoggedUserModel({required String name, required String email})
      : super(name: name, email: email);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory LoggedUserModel.fromMap(Map<String, dynamic> map) {
    return LoggedUserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoggedUserModel.fromJson(String source) =>
      LoggedUserModel.fromMap(json.decode(source));
}
