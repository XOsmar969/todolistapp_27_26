import 'package:get/get.dart';
import 'package:todolistapp_27_26/models/todo_model.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  var history = <Todo>[].obs;

  void addTodo(String title, String description, String category) {
    todos.add(Todo(title: title, description: description, category: category));
  }

  void removeTodo(int index) {
  todos.removeAt(index);
}

void removeHistory(int index) {
  history.removeAt(index);
}
  void markAsDone(int index) {
    var todo = todos[index];
    todo.isDone = true;
    history.add(todo);
    todos.removeAt(index);
  }
}
