import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_etiqa/model/todo.dart';
import 'package:todo_app_etiqa/provider/todos.dart';
import 'package:todo_app_etiqa/widget/todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String firstDate = '';
  String secDate = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
          content: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add New To-Do List',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TodoFormWidget(
                      onChangedTitle: (title) => setState(() => this.title = title),
                      onChangedFirstDate: (firstDate) =>
                          setState(() => this.firstDate = firstDate),
                      onChangedSecDate: (secDate) =>
                          setState(() => this.secDate = secDate),
                      onSavedTodo: addTodo,
                    ),
                  ],
                ),
            ),
          ),
      );

  void addTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: title,
        firstDate: firstDate,
        secDate: secDate,
        createdTime: DateTime.now(),
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
