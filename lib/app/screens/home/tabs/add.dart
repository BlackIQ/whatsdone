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
  @override
  Widget build(BuildContext context) {
    final TextEditingController _taskName = TextEditingController();
    final TextEditingController _taskNote = TextEditingController();

    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: _taskName,
                decoration: InputDecoration(
                  labelText: 'Task name',
                  hintText: 'Do that',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _taskNote,
                decoration: InputDecoration(
                  labelText: 'Task note',
                  hintText: 'Details of doing that',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_taskName.text.isNotEmpty && _taskNote.text.isNotEmpty) {
                    await DatabaseService.instance.add(
                      Task(
                        name: _taskName.text,
                        note: _taskNote.text,
                        id: Random().nextInt(999),
                        date: DateFormat('y/MMM/dd H:m:s').format(
                          DateTime.now(),
                        ),
                        status: 'home',
                      ),
                    );
                    setState(() {
                      _taskName.clear();
                      _taskNote.clear();
                    });
                  } else {
                    return showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Null task!?',
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                        content: Text(
                          'By submitting a null field or both null fields, there is no chance to insert anything!',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Ok',
                              style: TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      barrierDismissible: false,
                    );
                  }
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
