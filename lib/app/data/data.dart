import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class Tasks {
  Tasks(
      {this.row,
      required this.name,
      required this.id,
      required this.status,
      required this.date});

  final int? row;
  final String? name;
  final int? id;
  final String? status;
  final String? date;

  factory Tasks.fromMap(Map<String, dynamic> json) => Tasks(
        row: json['row'],
        name: json['name'],
        id: json['id'],
        status: json['status'],
        date: json['date'],
      );

  Map<String, dynamic> toMap() {
    return {
      'row': row,
      'name': name,
      'id': id,
      'status': status,
      'date': date,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'wd.db');
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
    var groceries =
        await db.query('tasks', where: 'status = ?', whereArgs: [status]);
    List<Tasks> groceryList = groceries.isNotEmpty
        ? groceries.map((c) => Tasks.fromMap(c)).toList()
        : [];
    return groceryList;
  }

  Future<int> add(Tasks grocery) async {
    Database db = await instance.database;
    return await db.insert('tasks', grocery.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Tasks grocery) async {
    Database db = await instance.database;
    return await db.update('tasks', grocery.toMap(),
        where: 'id = ?', whereArgs: [grocery.id]);
  }
}
