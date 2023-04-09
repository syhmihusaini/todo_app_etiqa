import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:to_do_list/data/local_storage/shared_preferences.dart';
import 'package:to_do_list/modules/to_do_list/controllers/todo_list_controller.dart';
import 'package:to_do_list/routes/app_routes.dart';
import 'package:to_do_list/utils/color_util.dart';
import 'package:to_do_list/utils/toast_util.dart';
import 'package:to_do_list/widgets/illustration.dart';
import 'package:to_do_list/widgets/todo_card.dart';

class ToDoListView extends GetView<ToDoListController> {
  const ToDoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.background,
      appBar: AppBar(
        title: const Text("To-Do List"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.transparent),
            onPressed: () {
              UserSharedPreferences.clearSharedPreference();
              ToastUtil.snackBar(
                  title: 'Success', message: 'Cleared cached data');
            },
          ),
        ],
      ),
      body: GetBuilder<ToDoListController>(
        builder: (ToDoListController controller) {
          if (controller.toDoList.isEmpty) {
            return const ToDoIllustration();
          } else {
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemCount: controller.toDoList.length,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
              itemBuilder: (BuildContext context, int index) {
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  secondaryActions: [
                    IconSlideAction(
                      color: Colors.red,
                      caption: 'Delete',
                      onTap: () =>
                          controller.deleteToDo(controller.toDoList[index].id!),
                      icon: Icons.delete,
                    )
                  ],
                  child: ToDoCard(
                    title: controller.toDoList[index].title ?? '',
                    endDate:
                        controller.toDoList[index].endDate ?? DateTime.now(),
                    startDate:
                        controller.toDoList[index].startDate ?? DateTime.now(),
                    checkBoxValue: controller.toDoList[index].isDone,
                    // onLongPress: () => controller.deleteToDo(controller.toDoList[index].id!),
                    onTap: () => Get.toNamed(AppRoutes.toDoForm,
                        arguments: controller.toDoList[index]),
                    onChanged: (bool? value) {
                      controller.toDoList[index].isDone = value!;
                      controller.update();
                      UserSharedPreferences.setToDoList(controller.toDoList);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.toDoForm, arguments: null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
