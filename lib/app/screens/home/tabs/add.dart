import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:whatsdone/app/services/database.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _tasktxt = TextEditingController();

  void _submit() async {
    var ontime = DateFormat('y/MMM/dd H:m:s').format(DateTime.now());
    int id = Random().nextInt(999);

    await DatabaseHelper.instance.add(
      Tasks(
        name: _tasktxt.text,
        id: id,
        date: ontime,
        status: 'home',
      ),
    );
    setState(() {
      _tasktxt.clear();
    });
  }

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
                onPressed: _submit,
                child: Text('Add this task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
