import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/data/local_storage/shared_preferences.dart';
import 'package:to_do_list/data/models/todo_model.dart';

class ToDoListController extends GetxController {
  List<ToDoModel> toDoList = <ToDoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // check if there is any to-do list in shared preferences
    toDoList = UserSharedPreferences.getToDoList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // delete to-do when on long press
  void deleteToDo(String id) {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete To-Do'),
        content: const Text('Are you sure you want to delete this To-Do?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              toDoList.removeWhere((ToDoModel e) => e.id == id);
              UserSharedPreferences.setToDoList(toDoList);
              update();
              Get.back();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
