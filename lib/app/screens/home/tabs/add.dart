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
    final TextEditingController _tasktxt = TextEditingController();

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
                onPressed: () async {
                  if (_tasktxt.text.isNotEmpty) {
                    await DatabaseService.instance.add(
                      Task(
                        name: _tasktxt.text,
                        id: Random().nextInt(999),
                        date: DateFormat('y/MMM/dd H:m:s').format(
                          DateTime.now(),
                        ),
                        status: 'home',
                      ),
                    );
                    setState(() {
                      _tasktxt.clear();
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
                          'By submitting a null task name, there is no chance to insert a null task!',
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
