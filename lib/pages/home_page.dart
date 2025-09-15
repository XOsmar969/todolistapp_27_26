import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/controllers/todo_controller.dart';
import 'package:todolistapp_27_26/widgets/todo_card.dart';
import 'package:todolistapp_27_26/routes/routes.dart';

class HomePage extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: SafeArea(
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
                onDone: () {
                  Get.defaultDialog(
                    title: "Konfirmasi",
                    middleText: "Yakin ingin tambah aktivitas di history?",
                    textCancel: "Batal",
                    textConfirm: "Ya",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      todoController.markAsDone(index);
                      Get.back();
                    },
                  );
                },
                onDelete: () {
                  Get.defaultDialog(
                    title: "Konfirmasi",
                    middleText: "Yakin ingin menghapus todo ini?",
                    textCancel: "Batal",
                    textConfirm: "Hapus",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      todoController.removeTodo(index);
                      Get.back();
                    },
                  );
                },
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addTodo),
        child: const Icon(Icons.add),
      ),
    );
  }
}
