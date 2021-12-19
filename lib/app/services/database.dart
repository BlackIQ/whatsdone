import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class Tasks {
  Tasks({
    this.row,
    this.name,
    this.id,
    this.status,
    this.date,
  });

  final int row;
  final String name;
  final int id;
  final String status;
  final String date;

  factory Tasks.fromMap(Map<String, dynamic> json) {
    return Tasks(
      row: json['row'],
      name: json['name'],
      id: json['id'],
      status: json['status'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'row': row,
      'name': name,
      'id': id,
      'date': date,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'whatsdone.db');
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

  Future<int> add(Tasks task, String table) async {
    Database db = await instance.database;
    return await db.insert(table, task.toMap());
  }

  Future<int> remove(int id, String table) async {
    Database db = await instance.database;
    return await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Tasks task, String table) async {
    Database db = await instance.database;
    return await db.update(
      table,
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
