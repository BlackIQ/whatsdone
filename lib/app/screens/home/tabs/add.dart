import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:whatsdone/app/models/task.dart';
import 'package:whatsdone/app/services/database.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _tasktxt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: _tasktxt,
                decoration: InputDecoration(
                  labelText: 'Task name',
                  hintText: 'Do that . . .',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  DatabaseService.instance.addTask(
                    Task(
                      name: _tasktxt.text,
                      id: Random().nextInt(999),
                      date: DateFormat('y/MMM/dd H:m:s').format(DateTime.now()),
                      status: 'home',
                    ),
                  );
                  setState(() {
                    _tasktxt.clear();
                  });
                },
                child: Text('Add this task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
