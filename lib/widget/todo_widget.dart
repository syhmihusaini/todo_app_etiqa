import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_etiqa/model/todo.dart';
import 'package:todo_app_etiqa/page/edit_todo_page.dart';
import 'package:todo_app_etiqa/provider/todos.dart';
import 'package:todo_app_etiqa/utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    @required this.todo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(todo.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () => editTodo(context, todo),
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () => deleteTodo(context, todo),
              icon: Icons.delete,
            )
          ],
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () => editTodo(context, todo),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (todo.title.isNotEmpty)
                      Container(
                          margin: EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              Text("Start Date"),
                              const SizedBox(width: 170),
                              Text("End Date")
                            ],
                          ),
                      ),
                    const SizedBox(height: 15),
                    Container(
                      child: Row(
                        children:[
                          Text(
                            todo.firstDate,
                            style: TextStyle(fontSize: 13, height: 1.5),
                          ),
                          const SizedBox(width: 150),
                          Text(
                            todo.secDate,
                            style: TextStyle(fontSize: 13, height: 1.5),
                          ),
                        ]
                      )
                    ),
                    const SizedBox(height: 20),
                    Container(
                      child: Row(
                        children: [
                        const SizedBox(width: 150),
                        Text("Tick if completed"),
                        Checkbox(
                          activeColor: Theme.of(context).primaryColor,
                          checkColor: Colors.white,
                          value: todo.isDone,
                          onChanged: (_) {
                            final provider =
                                Provider.of<TodosProvider>(context, listen: false);
                            final isDone = provider.toggleTodoStatus(todo);
                            Utils.showSnackBar(
                              context,
                              isDone ? 'Task completed' : 'Task marked incomplete',
                            );
                          },
                        ),
                        ]
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodoPage(todo: todo),
        ),
      );
}
