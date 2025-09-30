import 'package:get/get_instance/get_instance.dart';
import 'package:todolistapp_27_26/controllers/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashScreenController>(()=>SplashScreenController());
  }

}