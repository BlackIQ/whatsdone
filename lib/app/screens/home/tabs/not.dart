import 'package:flutter/material.dart';
import 'package:whatsdone/app/data/data.dart';

class NotDone extends StatefulWidget {
  @override
  _NotDoneState createState() => _NotDoneState();
}

class _NotDoneState extends State<NotDone> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tasks>>(
      future: DatabaseHelper.instance.getHome(),
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
                      'Nothing added',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Text(
                      'List is empty',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
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
                      onDismissed: (direction) {
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
                                .remove(task.id!, 'home');
                          });
                        } else {
                          setState(() {
                            DatabaseHelper.instance.add(
                              Tasks(
                                name: task.name,
                                id: task.id,
                                date: task.date,
                              ),
                              'done',
                            );
                          });
                          setState(() {
                            DatabaseHelper.instance
                                .remove(task.id!, 'home');
                          });
                        }
                      },
                      background: Container(
                        color: Colors.green,
                        child: Icon(
                          Icons.check,
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
