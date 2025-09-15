import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/controllers/todo_controller.dart';

class AddTodoPage extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  final categories = ["Sekolah", "Pekerjaan", "Pribadi"];
  final RxString selectedCategory = "Sekolah".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Todo")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: "Judul"),
            ),
            TextField(
              controller: descCtrl,
              decoration: const InputDecoration(labelText: "Deskripsi"),
            ),
            Obx(
              () => DropdownButton<String>(
                value: selectedCategory.value,
                items: categories
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) => selectedCategory.value = value!,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (titleCtrl.text.trim().isEmpty ||
                    descCtrl.text.trim().isEmpty) {
                  Get.snackbar(
                    "Gagal",
                    "Judul atau Deskripsi tidak boleh kosong",
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }

                todoController.addTodo(
                  titleCtrl.text,
                  descCtrl.text,
                  selectedCategory.value,
                );
                Get.back();
              },
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
