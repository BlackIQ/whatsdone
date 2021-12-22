import 'package:whatsdone/app/models/task.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class DatabaseService {
  DatabaseService._privateConstructor();

  static final DatabaseService instance = DatabaseService._privateConstructor();

  static Database _database;

  Future<Database> get database async => _database = await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'newwdb1.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks(
        row INTEGER PRIMARY KEY,
        name TEXT,
        note TEXT,
        id INTEGER,
        status TEXT,
        date TEXT
      )
    ''');
  }

  Future<List<Task>> getTasks(String status) async {
    Database db = await instance.database;

    var query = await db.query(
      'tasks',
      where: 'status = ?',
      whereArgs: [status],
    );
    List<Task> taskList = query.isNotEmpty ? query.map((c) => Task.fromMap(c)).toList() : [];
    return taskList;
  }

  Future<int> add(Task task) async {
    Database db = await instance.database;
    return await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Task task) async {
    Database db = await instance.database;
    return await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
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
