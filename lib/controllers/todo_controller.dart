import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  var history = <Todo>[].obs;

  final TextEditingController descCtrl = TextEditingController();
  final TextEditingController titleCtrl = TextEditingController();

  final categoryList = ["Work", "Personal", "Study"];
  var selectedCategory = "Study".obs;

  bool isValidInput(String title, String desc, String category) {
    return title.isNotEmpty && desc.isNotEmpty && category.isNotEmpty;
  }

  void handleAddTodo() {
    final title = titleCtrl.text.trim();
    final desc = descCtrl.text.trim();
    final category = selectedCategory.value;

    if (isValidInput(title, desc, category)) {
      addTodo(title, desc, category);

      titleCtrl.clear();
      descCtrl.clear();
      selectedCategory.value = "";

      Get.back();
      Get.snackbar(
        "Sukses",
        "Todo berhasil ditambahkan",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withAlpha(200),
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Error",
        "Semua field wajib diisi!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withAlpha(200),
        colorText: Colors.white,
      );
    }
  }

  void addTodo(String title, String description, String category) {
    todos.add(Todo(title: title, description: description, category: category));
  }

  void setCategory(String? value) {
    if (value != null) {
      selectedCategory.value = value;
    }
  }

  void removeTodo(int index) {
    if (index >= 0 && index < todos.length) {
      todos.removeAt(index);
    }
  }

  void removeHistory(int index) {
    if (index >= 0 && index < history.length) {
      history.removeAt(index);
    }
  }

  void markAsDone(int index) {
    if (index < 0 || index >= todos.length) return;

    var todo = todos[index];
    todo.isDone = true;
    history.add(todo);

    todos.removeAt(index);
  }

  void clearTodos() {
    todos.clear();
  }
}
