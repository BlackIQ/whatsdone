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
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(color: Colors.deepPurple);
      },
      itemCount: x.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          child: ListTile(
            subtitle: Text(x[index]['date']),
            title: Text(
              x[index]['name'],
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
              ),
            ),
          ),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              print('Go to trash');
            } else {
              print('Go to not');
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
