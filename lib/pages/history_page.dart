import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/controllers/todo_controller.dart';
import 'package:todolistapp_27_26/widgets/todo_card.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 600;

    return Scaffold(
      appBar: AppBar(title: const Text("History")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isWide ? size.width * 0.15 : 8),
        child: Obx(() {
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
              final historyItem = todoController.history[index];
              return TodoCard(
                todo: historyItem,
                onDelete: () {
                  Get.defaultDialog(
                    title: "Konfirmasi",
                    middleText: "Yakin ingin menghapus history ini?",
                    textCancel: "Batal",
                    textConfirm: "Hapus",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      todoController.removeHistory(index);
                      Get.back();
                    },
                  );
                },
              );
            },
          );
        }),
      ),
    );
  }
}
