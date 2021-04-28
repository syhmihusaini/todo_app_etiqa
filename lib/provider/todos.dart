import 'package:flutter/cupertino.dart';
import 'package:todo_app_etiqa/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Automated Testing Script',
      firstDate: '23 oct 2019',
      secDate: ' 23 oct 2019'
    )
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String firstDate, String secDate) {
    todo.title = title;
    todo.firstDate = firstDate;
    todo.secDate = secDate;


    notifyListeners();
  }
}
