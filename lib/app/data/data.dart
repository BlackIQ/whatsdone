import 'dart:math';
import 'package:intl/intl.dart';

void insert(String task) {
  String _task = task;
  var ontime = DateFormat('y/MMM/dd H:m:s').format(DateTime.now());
  int id = Random().nextInt(999);

  print(task);
  print(id);
  print(ontime);
}

void done(int row) {
  // Done
}

void home(int row) {
  // Home
}

void trash(int row) {
  // Trash
}

void delete(int row) {
  // Delete
}
