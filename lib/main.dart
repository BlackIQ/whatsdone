import 'package:whatsdone/app/services/authenticarion.dart';
import 'package:whatsdone/app/screens/landing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsdone/app/models/user.dart';
import 'package:whatsdone/app/models/task.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final database = openDatabase(
  //   join(await getDatabasesPath(), 'newd.db'),
  //   version: 1,
  //   onCreate: (db, version) {
  //     return db.execute('''
  //     CREATE TABLE tasks(
  //       row INTEGER PRIMARY KEY,
  //       name TEXT,
  //       id INTEGER,
  //       status TEXT,
  //       date TEXT
  //     )
  //   ''');
  //   },
  // );
  //
  // Future<List<Task>> selectTasks(String status) async {
  //   final db = await database;
  //   final List<Map<String, dynamic>> tasks = await db.query(
  //     'tasks',
  //     where: 'status = ?',
  //     whereArgs: [status],
  //   );
  //   return tasks.map((i) => Task.fromMap(i));
  // }
  //
  // Future<void> addTask(Task task) async {
  //   final db = await database;
  //   await db.insert(
  //     'tasks',
  //     task.toMap(),
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }
  //
  // Future<void> updateTask(Task task) async {
  //   final db = await database;
  //   await db.update(
  //     'tasks',
  //     task.toMap(),
  //     where: 'id = ?',
  //     whereArgs: [task.id],
  //   );
  // }
  //
  // Future<void> deleteTask(int id) async {
  //   final db = await database;
  //   await db.delete(
  //     'tasks',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Landing(),
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          textTheme: GoogleFonts.patrickHandTextTheme(),
        ),
      ),
    );
  }
}
