import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/controllers/todo_controller.dart';
import 'package:todolistapp_27_26/widgets/widget_textfield.dart';
import 'package:todolistapp_27_26/widgets/widget_dropdown.dart';
import 'package:todolistapp_27_26/widgets/widget_button.dart';

class AddTodoPage extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Todo")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            MyTextField(
              textEditingController: todoController.titleCtrl,
              labelText: "Title",
            ),
            MyTextField(
              textEditingController: todoController.descCtrl,
              labelText: "Deskripsi",
            ),
            const SizedBox(height: 20),
            CategoryDropdown(
              items: todoController.categoryList,
              onChanged: todoController.setCategory,
            ),
            const SizedBox(height: 20),
            CustomButton(text: "Add", onPressed: todoController.handleAddTodo),
          ],
        ),
      ),
    );
  }
}
