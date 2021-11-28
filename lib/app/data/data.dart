import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

class Tasks {
  Tasks(
      {this.row,
      required this.name,
      required this.id,
      required this.date});

  final int? row;
  final String? name;
  final int? id;
  final String? date;

  factory Tasks.fromMap(Map<String, dynamic> json) => Tasks(
        row: json['row'],
        name: json['name'],
        id: json['id'],
        date: json['date'],
      );

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

  static Database? _database;
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
      CREATE TABLE home(
        row INTEGER PRIMARY KEY,
        name TEXT,
        id INTEGER,
        date TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE done(
        row INTEGER PRIMARY KEY,
        name TEXT,
        id INTEGER,
        date TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE trash(
        row INTEGER PRIMARY KEY,
        name TEXT,
        id INTEGER,
        date TEXT
      )
    ''');
  }

  Future<List<Tasks>> getHome() async {
    Database db = await instance.database;
    var home = await db.query('home');
    List<Tasks> homeList = home.isNotEmpty
        ? home.map((c) => Tasks.fromMap(c)).toList()
        : [];
    return homeList;
  }

  Future<List<Tasks>> getDone() async {
    Database db = await instance.database;
    var done = await db.query('done');
    List<Tasks> doneList = done.isNotEmpty
        ? done.map((c) => Tasks.fromMap(c)).toList()
        : [];
    return doneList;
  }

  Future<List<Tasks>> getTrash() async {
    Database db = await instance.database;
    var trash = await db.query('trash');
    List<Tasks> trashList = trash.isNotEmpty
        ? trash.map((c) => Tasks.fromMap(c)).toList()
        : [];
    return trashList;
  }

  Future<int> add(Tasks grocery, String table) async {
    Database db = await instance.database;
    return await db.insert(table, grocery.toMap());
  }

  Future<int> remove(int id, String table) async {
    Database db = await instance.database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Tasks grocery, String table) async {
    Database db = await instance.database;
    return await db.update(table, grocery.toMap(),
        where: 'id = ?', whereArgs: [grocery.id]);
  }
}

Future<void> pageRefresh() {
  return Future.delayed(
    Duration(
      seconds: 1,
    ),
  );
}