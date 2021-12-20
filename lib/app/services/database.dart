import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:whatsdone/app/models/task.dart';

class DatabaseService {
  static DatabaseService _databaseService;
  static Database _database;

  DatabaseService._createInstance();

  static final DatabaseService instance = DatabaseService._createInstance();

  factory DatabaseService() {
    if (_databaseService == null) {
      _databaseService = DatabaseService._createInstance();
    }
    return _databaseService;
  }

  Future<Database> get database async {
    if (database == null) {
      _database = await initDatabase();
    }
    return _database;
  }

  Future<Database> initDatabase() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'newd.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
      CREATE TABLE tasks(
        row INTEGER PRIMARY KEY,
        name TEXT,
        id INTEGER,
        status TEXT,
        date TEXT
      )
    ''');
      },
    );
    return database;
  }

  Future<List<Task>> selectTasks(String status) async {
    final db = await database;
    final List<Map<String, dynamic>> tasks = await db.query(
      'tasks',
      where: 'status = ?',
      whereArgs: [status],
    );
    return tasks.map((i) => Task.fromMap(i));
  }

  Future<void> addTask(Task task) async {
    final db = await database;
    await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTask(Task task) async {
    final db = await database;
    await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

Future<void> pageRefresh() {
  return Future.delayed(
    Duration(
      seconds: 1,
    ),
  );
}
