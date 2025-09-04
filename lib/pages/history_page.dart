import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/controllers/todo_controller.dart';
import 'package:todolistapp_27_26/widgets/todo_card.dart';

class HistoryPage extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History")),
      body: Obx(() {
        if (todoController.history.isEmpty) {
          return const Center(
            child: Text(
              "Belum ada todo yang selesai.",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          itemCount: todoController.history.length,
          itemBuilder: (context, index) {
            final todo = todoController.history[index];
            return TodoCard(
              todo: todo,
              onDelete: () => todoController.removeHistory(index),
            );
          },
        );
      }),
    );
  }
}
