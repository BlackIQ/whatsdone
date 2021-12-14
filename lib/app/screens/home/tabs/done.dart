import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoneTasks extends StatefulWidget {
  @override
  _DoneTasksState createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  List<Map> x = [
    {
      'name': 'amir',
      'date': 'amir',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: x.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          child: ListTile(
            title: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(x[index]['name']),
                  SizedBox(height: 5),
                  Text(
                    x[index]['date'],
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              print('Delete');
            } else {
              print('back to done');
            }
          },
          background: Container(
            color: Colors.blueAccent,
            child: Icon(
              Icons.timer,
              color: Colors.white,
            ),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
