import 'dart:convert';

class ToDoModel {
  String? id;
  String? title;
  DateTime? startDate;
  DateTime? endDate;
  bool isDone;
  DateTime? timeLeft;

  ToDoModel({
    this.id,
    this.title,
    this.startDate,
    this.endDate,
    this.isDone = false,
    this.timeLeft,
  });

  factory ToDoModel.fromJson(Map<String, dynamic> json) {
    return ToDoModel(
      id: json['id'],
      title: json['title'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      isDone: json['is_done'],
      timeLeft: DateTime.parse(json['time_left']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'is_done': isDone,
      'time_left': timeLeft?.toIso8601String(),
    };
  }

  // String toJsonEncode() => json.encode(toJson());
  //
  // factory ToDoModel.fromJsonDecode(String source) => ToDoModel.fromJson(json.decode(source));
}
