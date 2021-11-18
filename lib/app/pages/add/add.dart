import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  String _task = '';

  void changeText(String task) {
    setState(() {
      _task = task;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Task name',
              ),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Task name is required';
                }
              },
              onSaved: (String? value) {
                changeText(value!);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState!.validate()) {
                  changeText('');
                }
                _formKey.currentState!.save();
                print(_task);
              },
              child: Text(
                'Add this task'
              ),
            ),
          ],
        ),
      ),
    );
  }
}
