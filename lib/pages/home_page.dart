import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/controllers/edit_todo_controller.dart';
import 'package:todolistapp_27_26/controllers/todo_controller.dart';
import 'package:todolistapp_27_26/widgets/todo_card.dart';
import 'package:todolistapp_27_26/routes/routes.dart';
import 'package:todolistapp_27_26/pages/edit_todo_page.dart';

class HomePage extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();
  final EditTodoController editTodoController = Get.put(EditTodoController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 600;

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isWide ? size.width * 0.15 : 8),
          child: Obx(() {
            if (todoController.todos.isEmpty) {
              return const Center(
                child: Text(
                  "Belum ada todo.\nTambahkan todo baru dengan tombol +",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
            return ListView.builder(
              itemCount: todoController.todos.length,
              itemBuilder: (context, index) {
                final todo = todoController.todos[index];
                return TodoCard(
                  todo: todo,
                  onDone: () => todoController.markAsDone(index),
                  onDelete: () => todoController.removeTodo(index),
                  onEdit: () {
                    editTodoController.setEditData(todo, index);
                    Get.to(() => EditTodoPage());
                  },
                );
              },
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addTodo),
        child: const Icon(Icons.add),
      ),
    );
  }
}
