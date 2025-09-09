class Todo {
  String title;
  String description;
  String category;
  bool isDone;

  Todo({
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
  });
}
