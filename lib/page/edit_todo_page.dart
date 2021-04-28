import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_etiqa/model/todo.dart';
import 'package:todo_app_etiqa/provider/todos.dart';
import 'package:todo_app_etiqa/widget/todo_form_widget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key key, @required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();

  String title;
  String firstDate;
  String secDate;

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    firstDate = widget.todo.firstDate;
    secDate = widget.todo.secDate;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Todo'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.removeTodo(widget.todo);

                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: TodoFormWidget(
              title: title,
              firstDate: firstDate,
              secDate: secDate,
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedFirstDate: (firstDate) =>
                  setState(() => this.firstDate = firstDate),
              onChangedSecDate: (secDate) =>
                  setState(() => this.secDate = secDate),
              onSavedTodo: saveTodo,
            ),
          ),
        ),
      );

  void saveTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(widget.todo, title, firstDate, secDate);

      Navigator.of(context).pop();
    }
  }
}
