import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsdone/app/models/task.dart';
import 'package:whatsdone/app/services/database.dart';
import 'package:whatsdone/app/widgets/toast.dart';

class UpdateTask extends StatefulWidget {
  UpdateTask({
    this.task,
  });

  final task;

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _note = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ),
        title: Text('Update task'),
        actions: [
          FlatButton(
            onPressed: () {
              if (_name.text == '' && _note.text == '') {
                return showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Null changes!?',
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                    content: Text(
                      'You filled none of the fields. So app is not going to replace data with null items.',
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
              } else {
                print(_name.text);
                print(_note.text);
                setState(() {
                  DatabaseService.instance.update(
                    Task(
                      id: widget.task.id,
                      date: widget.task.date,
                      status: widget.task.status,
                      name:
                          _name.text.isNotEmpty ? _name.text : widget.task.name,
                      note:
                          _note.text.isNotEmpty ? _note.text : widget.task.note,
                      row: widget.task.row,
                    ),
                  );
                });
                sendToast('Task data is changed', true);
              }
            },
            child: Text(
              'Update',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: widget.task.name,
                labelText: 'Name',
              ),
              controller: _name,
              obscureText: false,
            ),
            SizedBox(height: 5),
            TextField(
              decoration: InputDecoration(
                hintText: widget.task.note,
                labelText: 'Note',
              ),
              controller: _note,
              obscureText: false,
            ),
            SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FaIcon(
                  FontAwesomeIcons.exclamationTriangle,
                  color: Colors.red,
                ),
                SizedBox(width: 20),
                Text(
                  'Note',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'You only can change name and note here. It is impossible to change date and id.',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
