import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _tasktxt = TextEditingController();
  void _submit() {
    var ontime = DateFormat('y/MMM/dd H:m:s').format(DateTime.now());
    int id = Random().nextInt(999);

    print(_tasktxt.text);
    print(id);
    print(ontime);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Card(
        child: Column(children: <Widget>[
          TextField(
            controller: _tasktxt,
            decoration: InputDecoration(
              labelText: 'Task name',
              hintText: 'Do that . . .',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _submit,
            child: Text('Add this task'),
          ),
        ]),
      ),
    );
  }
}
