import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list/data/models/todo_model.dart';
import 'package:to_do_list/modules/to_do_list/controllers/todo_list_controller.dart';

void main() {
  test('Initializes toDoList with empty', () {
    ToDoListController _toDoListController = ToDoListController();
    expect(_toDoListController.toDoList.length, 0);
  });

  test('Added toDoList', () {
    ToDoListController _toDoListController = ToDoListController();
    _toDoListController.toDoList.add(ToDoModel(
      id: UniqueKey().toString(),
      title: 'Test',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      isDone: false,
      timeLeft: DateTime.now(),
    ));
    expect(_toDoListController.toDoList.length, 1);
  });

  test('ToDo is completed', () {
    ToDoListController _toDoListController = ToDoListController();
    _toDoListController.toDoList.add(ToDoModel(
      id: UniqueKey().toString(),
      title: 'Test',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      isDone: false,
      timeLeft: DateTime.now(),
    ));

    _toDoListController.toDoList[0].isDone = true;
    expect(_toDoListController.toDoList[0].isDone, true);
  });
}
