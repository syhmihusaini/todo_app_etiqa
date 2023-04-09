import 'package:get/get.dart';

import '../controllers/todo_form_controller.dart';

class ToDoFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToDoFormController>(
      () => ToDoFormController(),
    );
  }
}
