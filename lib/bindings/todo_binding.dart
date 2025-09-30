import 'package:get/get.dart';
import 'package:todolistapp_27_26/controllers/todo_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
