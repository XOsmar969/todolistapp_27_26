import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/controllers/edit_todo_controller.dart';
import 'package:todolistapp_27_26/controllers/todo_controller.dart';
import 'package:todolistapp_27_26/models/todo_model.dart';

class EditTodoPage extends StatelessWidget {

  final TodoController todoController = Get.find<TodoController>();
  
 
  @override
  Widget build(BuildContext context) {
    EditTodoController.setEditData(todo, index);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Todo"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              todoController.handleAddTodo();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: todoController.titleCtrl,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: todoController.descCtrl,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 16),
            Obx(() => DropdownButtonFormField<String>(
                  value: todoController.selectedCategory.value,
                  items: todoController.categoryList
                      .map((cat) =>
                          DropdownMenuItem(value: cat, child: Text(cat)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      todoController.selectedCategory.value = value;
                    }
                  },
                  decoration: const InputDecoration(labelText: "Category"),
                )),
            const SizedBox(height: 16),
            Obx(() => CheckboxListTile(
                  title: const Text("Mark as Done"),
                  value: todoController.isDone.value,
                  onChanged: (val) {
                    todoController.isDone.value = val ?? false;
                  },
                )),
          ],
        ),
      ),
    );
  }
}
