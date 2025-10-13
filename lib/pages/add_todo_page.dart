import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/controllers/todo_controller.dart';
import 'package:todolistapp_27_26/widgets/widget_textfield.dart';
import 'package:todolistapp_27_26/widgets/widget_dropdown.dart';
import 'package:todolistapp_27_26/widgets/widget_button.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => AddTodoPageState();
}

class AddTodoPageState extends State<AddTodoPage> {
  final TodoController todoController = Get.find<TodoController>();

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Todo")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: MyTextField(
                textEditingController: todoController.titleCtrl,
                labelText: "Title",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: MyTextField(
                textEditingController: todoController.descCtrl,
                labelText: "Deskripsi",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: CategoryDropdown(
                items: todoController.categoryList,
                onChanged: (value) {
                  setState(() {
                    todoController.setCategory(value);
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: CustomButton(
                text: "Add",
                onPressed: todoController.handleAddTodo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
