import 'dart:ui';
import 'package:get/get.dart';
import 'package:todolistapp_27_26/routes/routes.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  void login(String username, String password) {
    if (username == "admin" && password == "admin123") {
      isLoggedIn.value = true;
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.snackbar("Login Failed", "Username / Password salah");
    }
  }
  void logout() {
Get.defaultDialog(
      title: "Konfirmasi",
      middleText: "Apakah kamu yakin ingin logout?",
      textCancel: "Batal",
      textConfirm: "Logout",
      confirmTextColor: const Color(0xFFFFFFFF),
      onConfirm: () {
         Get.offAllNamed(AppRoutes.login);
      },
    );
  }
}
