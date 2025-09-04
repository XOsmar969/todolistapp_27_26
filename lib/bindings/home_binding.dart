import 'package:get/get.dart';
import 'package:todolistapp_27_26/controllers/home_controller.dart';
import 'package:todolistapp_27_26/controllers/todo_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
