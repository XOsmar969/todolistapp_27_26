import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/routes/routes.dart';
import 'package:todolistapp_27_26/controllers/todo_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  final TextEditingController controllerUsername = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TodoController todoController = Get.find<TodoController>();
  login() async {
    if (controllerUsername.text == "admin" &&
        controllerPassword.text == "admin123") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", controllerUsername.text);
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.snackbar(
        "Login Failed",
        "Username / Password salah",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFFF0000),
        colorText: const Color(0xFFFFFFFF),
      );
    }
  }

  logout() {
    Get.defaultDialog(
      title: "Konfirmasi",
      middleText: "Apakah kamu yakin ingin logout?",
      textCancel: "Batal",
      textConfirm: "Logout",
      confirmTextColor: const Color(0xFFFFFFFF),
      onConfirm: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove("username");
        todoController.clearTodos();
        isLoggedIn.value = false;
        Get.offAllNamed(AppRoutes.splashscreen);
      },
    );
  }
}
