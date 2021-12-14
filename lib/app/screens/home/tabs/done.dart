import 'package:flutter/material.dart';
import 'package:whatsdone/app/data/data.dart';

class DoneTasks extends StatefulWidget {
  @override
  _DoneTasksState createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {

  void toTrash(int id) {

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tasks>>(
      future: DatabaseHelper.instance.getDone(),
      builder: (BuildContext context, AsyncSnapshot<List<Tasks>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.deepPurple,
            ),
          );
        }
        return snapshot.data!.isEmpty
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
            : RefreshIndicator(
                color: Colors.deepPurple,
                onRefresh: pageRefresh,
                child: ListView(
                  children: snapshot.data!.map((task) {
                    return Dismissible(
                      key: UniqueKey(),
                      child: ListTile(
                        title: Container(
                          margin: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(task.name!),
                              SizedBox(height: 5),
                              Text(
                                task.date!,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.deepPurple),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onDismissed: (direction)  {
                        if (direction == DismissDirection.endToStart) {
                          setState(() {
                            DatabaseHelper.instance.add(
                              Tasks(
                                name: task.name,
                                id: task.id,
                                date: task.date,
                              ),
                              'trash',
                            );
                          });
                          setState(() {
                            DatabaseHelper.instance
                                .remove(task.id!, 'done');
                          });
                        } else {
                          setState(() {
                            DatabaseHelper.instance.add(
                              Tasks(
                                name: task.name,
                                id: task.id,
                                date: task.date,
                              ),
                              'home',
                            );
                          });
                          setState(() {
                            DatabaseHelper.instance
                                .remove(task.id!, 'done');
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
                ),
              );
      },
    );
  }
}