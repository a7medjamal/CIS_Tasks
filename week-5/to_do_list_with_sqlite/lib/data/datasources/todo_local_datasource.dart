import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/todo_model.dart';

class TodoLocalDatasource {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'todos.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            dueDate TEXT
          )
        ''');
      },
    );
  }

  Future<List<TodoModel>> getTodos() async {
    final db = await database;
    final result = await db.query('todos');
    return result.map((e) => TodoModel.fromMap(e)).toList();
  }

  Future<void> insertTodo(TodoModel todo) async {
    final db = await database;
    await db.insert('todos', todo.toMap());
  }
}
