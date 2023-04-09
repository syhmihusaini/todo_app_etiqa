import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/data/local_storage/shared_preferences.dart';
import 'package:to_do_list/data/models/todo_model.dart';
import 'package:to_do_list/modules/to_do_list/controllers/todo_list_controller.dart';
import 'package:to_do_list/utils/date_util.dart';
import 'package:to_do_list/utils/toast_util.dart';

class ToDoFormController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final ToDoListController toDoListController = Get.find<ToDoListController>();
  final FocusNode titleFocusNode = FocusNode();

  Rxn<DateTime> startDate = Rxn<DateTime>();
  Rxn<DateTime> endDate = Rxn<DateTime>();
  ToDoModel? toDoEdit;

  @override
  void onInit() {
    super.onInit();
    checkIfEdit();
  }

  @override
  void onClose() {
    titleController.dispose();
    titleFocusNode.dispose();
    super.onClose();
  }

  // create new to-do
  void onCreateToDo() {
    ToDoModel toDo = ToDoModel(
      id: UniqueKey().toString(),
      title: titleController.text,
      startDate: startDate.value,
      endDate: endDate.value,
      isDone: false,
      timeLeft: DateTime.now(),
    );
    // add new to-do on top of the list
    toDoListController.toDoList = <ToDoModel>[
      toDo,
      ...toDoListController.toDoList
    ];
    // update to-do list
    toDoListController.update();
    // save to-do list to shared preferences
    UserSharedPreferences.setToDoList(toDoListController.toDoList);
    Get.back();
    ToastUtil.snackBar(title: 'Success', message: 'To-Do added successfully');
  }

  // check if from edit to-do
  void checkIfEdit() {
    toDoEdit = Get.arguments;
    if (toDoEdit != null) {
      titleController.text = toDoEdit!.title!;
      startDate.value = toDoEdit!.startDate;
      endDate.value = toDoEdit!.endDate;
      startDateController.text =
          DateUtil.formatDefaultDate(toDoEdit!.startDate!);
      endDateController.text = DateUtil.formatDefaultDate(toDoEdit!.endDate!);
    }
  }

  void onEditToDo() {
    ToDoModel toDo = ToDoModel(
      id: toDoEdit!.id,
      title: titleController.text,
      startDate: startDate.value,
      endDate: endDate.value,
      isDone: toDoEdit!.isDone,
      timeLeft: DateTime.now(),
    );
    // update selected to-do
    toDoListController.toDoList.asMap().forEach((int index, ToDoModel e) {
      if (e.id == toDoEdit!.id) {
        toDoListController.toDoList[index] = toDo;
      }
    });
    // update to-do list
    toDoListController.update();
    // save to-do list to shared preferences
    UserSharedPreferences.setToDoList(toDoListController.toDoList);
    Get.back();
    ToastUtil.snackBar(title: 'Success', message: 'To-Do update successfully');
  }

  // show date picker for start date
  Future<void> pickStartDate(BuildContext context) async {
    titleFocusNode.unfocus();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      currentDate: startDate.value ?? DateTime.now(),
    );
    if (picked != null && picked != startDate.value) {
      startDate.value = picked;
      startDateController.text = DateUtil.formatDefaultDate(startDate.value!);
    }
  }

  // show date picker for end date
  Future<void> pickEndDate(BuildContext context) async {
    titleFocusNode.unfocus();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      currentDate: endDate.value ?? DateTime.now(),
    );

    if (picked != null && picked != endDate.value) {
      endDate.value = picked;
      endDateController.text = DateUtil.formatDefaultDate(endDate.value!);
    }
  }

  String? validateStartDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please select a start date';
    } else if (startDate.value != null &&
        endDate.value != null &&
        startDate.value!.isAfter(endDate.value!)) {
      return 'Start date must be before end date';
    }
    return null;
  }

  String? validateEndDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please select a end date';
    } else if (startDate.value != null &&
        endDate.value != null &&
        startDate.value!.isAfter(endDate.value!)) {
      return 'End date must be after start date';
    }
    return null;
  }

  DateTime getEndDateFirstDate() {
    if (toDoEdit != null) {
      return toDoEdit!.startDate!;
    } else if (startDate.value != null) {
      return startDate.value!;
    } else {
      return DateTime.now();
    }
  }

  DateTime getStartDateLastDate() {
    if (toDoEdit != null) {
      return toDoEdit!.endDate!;
    } else if (endDate.value != null) {
      return endDate.value!;
    } else {
      return DateTime(2100);
    }
  }

  String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please key in your To-Do title';
    }
    return null;
  }
}
