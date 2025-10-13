import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todos.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, category TEXT, isDone INTEGER)',
        );
      },
    );
  }


  Future<int> insertTodo(String title, String description, String category) async {
    final client = await db;
    return client.insert('todos', {
      'title': title,
      'description': description,
      'category': category,
      'isDone': 0
    });
  }


  Future<List<Map<String, dynamic>>> getTodos() async {
    final client = await db;
    return client.query('todos', orderBy: 'id DESC');
  }

  Future<int> updateTodo(int id, String title, String description, String category, int isDone) async {
    final client = await db;
    return await client.update(
      'todos',
      {
        'title': title,
        'description': description,
        'category': category,
        'isDone': isDone
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTodo(int id) async {
    final client = await db;
    await client.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
