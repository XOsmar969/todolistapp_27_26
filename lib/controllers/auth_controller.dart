import 'package:get/get.dart';
import 'package:todolistapp_27_26/routes/routes.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  void login(String username, String password) {
    if (username == "admin" && password == "admin") {
      isLoggedIn.value = true;
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.snackbar("Login Failed", "Username / Password salah");
    }
  }

  void logout() {
    isLoggedIn.value = false;
    Get.offAllNamed(AppRoutes.login);
  }
}
