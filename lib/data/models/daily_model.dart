import 'dart:convert';

import 'package:daily_scrum/domain/entities/daily_entity.dart';

class DailyModel extends DailyEntity {
  DailyModel({
    required String createdAt,
    required String todoYesterday,
    required String todoToday,
    required String thereAnyImpediment,
    required String id,
  }) : super(
            createdAt: createdAt,
            todoYesterday: todoYesterday,
            todoToday: todoToday,
            thereAnyImpediment: thereAnyImpediment,
            id: id);

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt,
      'todo_yesterday': todoYesterday,
      'todo_today': todoToday,
      'there_any_impediment': thereAnyImpediment,
      'id': id,
    };
  }

  factory DailyModel.fromMap(Map<String, dynamic> map) {
    return DailyModel(
      createdAt: map['createdAt'] ?? '',
      todoYesterday: map['todo_yesterday'] ?? '',
      todoToday: map['todo_today'] ?? '',
      thereAnyImpediment: map['there_any_impediment'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyModel.fromJson(String source) =>
      DailyModel.fromMap(json.decode(source));
}
