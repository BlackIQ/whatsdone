import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:whatsdone/app/models/task.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async => _database = await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'wd3.db');
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
        id INTEGER,
        status TEXT,
        date TEXT
      )
    ''');
  }

  Future<List<Tasks>> getTasks(String status) async {
    Database db = await instance.database;
    var home = await db.query(
      'tasks',
      where: 'status = ?',
      whereArgs: [status],
    );
    List<Tasks> homeList =
        home.isNotEmpty ? home.map((c) => Tasks.fromMap(c)).toList() : [];
    return homeList;
  }

  Future<int> add(Tasks task) async {
    Database db = await instance.database;
    return await db.insert('tasks', task.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Tasks task) async {
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
