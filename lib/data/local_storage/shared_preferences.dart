import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/data/models/todo_model.dart';

class UserSharedPreferences {
  static late SharedPreferences _preferences;

  static Future<SharedPreferences> init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<void> setToDoList(List<ToDoModel> todoList) async {
    final String todoJson =
        jsonEncode(todoList.map((ToDoModel e) => e.toJson()).toList());
    await _preferences.setString('todo_list', todoJson);
  }

  static List<ToDoModel> getToDoList() {
    final String? todoJson = _preferences.getString('todo_list');
    if (todoJson != null) {
      return (jsonDecode(todoJson) as List<dynamic>)
          .map((dynamic e) => ToDoModel.fromJson(e))
          .toList();
    }
    return <ToDoModel>[];
  }

  static Future<void> clearSharedPreference() => _preferences.clear();
}
