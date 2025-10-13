class Todo {
  int? id;
  String title;
  String description;
  String category;
  bool isDone;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
  });
}
