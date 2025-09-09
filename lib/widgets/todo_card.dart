import 'package:flutter/material.dart';
import 'package:todolistapp_27_26/controllers/todo_controller.dart';
import 'package:todolistapp_27_26/models/todo_model.dart';
class TodoCard extends StatelessWidget {
  final Todo todo;
  final VoidCallback? onDone;
  final VoidCallback? onDelete;

  const TodoCard({super.key, required this.todo, this.onDone, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text("${todo.description} • ${todo.category}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onDone != null)
              IconButton(
                icon: const Icon(Icons.check, color: Colors.green),
                onPressed: onDone,
              ),
            if (onDelete != null)
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
          ],
        ),
      ),
    );
  }
}
