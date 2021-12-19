import 'package:flutter/material.dart';
import 'package:whatsdone/app/services/database.dart';

class DoneTasks extends StatefulWidget {
  @override
  _DoneTasksState createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tasks>>(
      future: DatabaseHelper.instance.getTasks('home'),
      builder: (BuildContext context, AsyncSnapshot<List<Tasks>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.deepPurple,
            ),
          );
        }
        return snapshot.data.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You did everything',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      'Congratulations',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              )
            : ListView(
                children: snapshot.data.map((task) {
                  return Dismissible(
                    key: UniqueKey(),
                    child: ListTile(
                      title: Text(
                        task.name,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepPurple,
                        ),
                      ),
                      subtitle: Text(
                        task.date,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        setState(() {
                          DatabaseHelper.instance.update(
                            Tasks(
                              id: task.id,
                              date: task.date,
                              name: task.name,
                              status: 'trash',
                            ),
                          );
                        });
                      } else {
                        setState(() {
                          DatabaseHelper.instance.update(
                            Tasks(
                              id: task.id,
                              date: task.date,
                              name: task.name,
                              status: 'home',
                            ),
                          );
                        });
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
                }).toList(),
              );
      },
    );
  }
}
