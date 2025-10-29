import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'todo_model.dart';

class TodoDatabase {
  // Singleton pattern
  TodoDatabase._privateConstructor();
  static final TodoDatabase instance = TodoDatabase._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'TodoDB.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Todo(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            date TEXT
          )
        ''');
      },
    );
  }

  Future<List<ToDoModel>> getTodoItems() async {
    final db = await database;
    final result = await db.query('Todo', orderBy: 'id DESC');
    return result.map((map) => ToDoModel.fromMap(map)).toList();
  }

  Future<int> insertTodoItem(ToDoModel item) async {
    final db = await database;
    return await db.insert(
      'Todo',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateTodoItem(ToDoModel item) async {
    final db = await database;
    return await db.update(
      'Todo',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteTodoItem(int id) async {
    final db = await database;
    return await db.delete(
      'Todo',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Optional: close DB
  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
