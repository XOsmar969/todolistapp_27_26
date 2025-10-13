import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/models/todo_model.dart';
import 'package:todolistapp_27_26/helper/db_helper.dart';
import 'package:todolistapp_27_26/controllers/todo_controller.dart';

class EditTodoController extends GetxController {
  final DBHelper _dbHelper = DBHelper();
  final TodoController todoController = Get.find<TodoController>();
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  RxString selectedCategory = ''.obs;
  RxBool isDone = false.obs;
  int? todoIndex;
  Todo? currentTodo;

 void setEditData(Todo todo, int index) {
  currentTodo = todo;
  todoIndex = todo.id; 
  titleCtrl.text = todo.title;
  descCtrl.text = todo.description;
  selectedCategory.value = todo.category;
  isDone.value = todo.isDone;
}
  Future<void> updateTodo() async {
    if (currentTodo == null || todoIndex == null) return;

    final title = titleCtrl.text.trim();
    final desc = descCtrl.text.trim();
    final category = selectedCategory.value;
    final done = isDone.value;
    if (title.isEmpty || desc.isEmpty || category.isEmpty) {
      Get.snackbar(
        "Error",
        "Semua field wajib diisi!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withAlpha(200),
        colorText: Colors.white,
      );
      return;
    }
    await _dbHelper.updateTodo(
      todoIndex!, 
      title,
      desc,
      category,
      done ? 1 : 0,
    );
    todoController.fetchTodos();
    Get.back();
    Get.snackbar(
      "Sukses",
      "Todo berhasil diupdate",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withAlpha(200),
      colorText: Colors.white,
    );
  }
  @override
  void onClose() {
    titleCtrl.dispose();
    descCtrl.dispose();
    super.onClose();
  }
}
