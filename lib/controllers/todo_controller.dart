import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/models/todo_model.dart';
import 'package:todolistapp_27_26/helper/db_helper.dart';

class TodoController extends GetxController {
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  final _dbHelper = DBHelper();

  var todos = <Todo>[].obs;
  var history = <Todo>[].obs;

  final categoryList = ["Work", "Personal", "Study"];
  var selectedCategory = "Study".obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

 
  Future<void> fetchTodos() async {
    final data = await _dbHelper.getTodos();
    todos.value = data.map((e) => Todo(
      id: e['id'] as int,
      title: e['title'] as String,
      description: e['description'] as String,
      category: e['category'] as String,
      isDone: e['isDone'] == 1,
    )).toList();
  }

  
  bool isValidInput(String title, String desc, String category) {
    return title.isNotEmpty && desc.isNotEmpty && category.isNotEmpty;
  }

 
  Future<void> handleAddTodo() async {
    final title = titleCtrl.text.trim();
    final desc = descCtrl.text.trim();
    final category = selectedCategory.value;

    if (isValidInput(title, desc, category)) {
      await _dbHelper.insertTodo(title, desc, category);
      titleCtrl.clear();
      descCtrl.clear();
      selectedCategory.value = "Study";

      await fetchTodos();

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

 
  void setCategory(String? value) {
    if (value != null) selectedCategory.value = value;
  }

 
  Future<void> markAsDone(int index) async {
    if (index < 0 || index >= todos.length) return;

    final todo = todos[index];
    await _dbHelper.updateTodo(
      todo.id!,
      todo.title,
      todo.description,
      todo.category,
      1, 
    );

    todo.isDone = true;
    history.add(todo);
    todos.removeAt(index);

    Get.snackbar(
      "Selesai",
      "Todo '${todo.title}' dipindahkan ke history",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue.withAlpha(200),
      colorText: Colors.white,
    );
  }

 
  Future<void> removeTodo(int index) async {
    if (index >= 0 && index < todos.length) {
      final todo = todos[index];
      await _dbHelper.deleteTodo(todo.id!);
      todos.removeAt(index);

      Get.snackbar(
        "Dihapus",
        "Todo '${todo.title}' berhasil dihapus",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange.withAlpha(200),
        colorText: Colors.white,
      );
    }
  }

 
  Future<void> removeHistory(int index) async {
    if (index >= 0 && index < history.length) {
      final todo = history[index];
      await _dbHelper.deleteTodo(todo.id!);
      history.removeAt(index);
    }
  }


  void clearTodos() {
    todos.clear();
  }

  @override
  void onClose() {
    titleCtrl.dispose();
    descCtrl.dispose();
    super.onClose();
  }
}
