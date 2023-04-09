import 'package:get/get.dart';

import '../controllers/todo_list_controller.dart';

class ToDoListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToDoListController>(
      () => ToDoListController(),
    );
  }
}
