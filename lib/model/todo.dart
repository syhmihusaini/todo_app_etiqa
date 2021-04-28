 import 'package:flutter/cupertino.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String id;
  String firstDate;
  String secDate;
  bool isDone;

  Todo({
    @required this.createdTime,
    @required this.title,
    this.firstDate,
    this.secDate,
    this.id,
    this.isDone = false,
  });
}
