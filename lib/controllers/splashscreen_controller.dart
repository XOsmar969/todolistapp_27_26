import 'package:get/get.dart';
import 'package:todolistapp_27_26/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
     // TODO: implement onInit
    super.onInit();
     //cek if username is stored
    checkLogin();
  }

  checkLogin() async{
    await Future.delayed(Duration(seconds: 5));
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString("username");
    if (savedUsername != null) {
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
