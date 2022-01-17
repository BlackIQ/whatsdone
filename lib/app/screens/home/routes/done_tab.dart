import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsdone/app/screens/home/routes/review_tak_page.dart';
import 'package:whatsdone/app/screens/home/routes/update_screen.dart';
import 'package:whatsdone/app/services/database.dart';
import 'package:whatsdone/app/models/task.dart';
import 'package:whatsdone/app/widgets/buttons/menu_button.dart';
import 'package:whatsdone/app/widgets/modal/modalbottom.dart';
import 'package:whatsdone/app/widgets/toast.dart';

class DoneTasks extends StatefulWidget {
  @override
  _DoneTasksState createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
      future: DatabaseService.instance.getTasks('done'),
      builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
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
                children: snapshot.data.map(
                  (task) {
                    return Dismissible(
                      key: UniqueKey(),
                      child: ListTile(
                        onTap: () => modalBottom(context, task.name, task.note, false),
                        onLongPress: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MenuButton(
                                    isDelete: false,
                                    text: 'Review task',
                                    icon: FontAwesomeIcons.boxOpen,
                                    click: () {
                                      modalBottom(context, task.name, task.note, true);
                                    },
                                  ),
                                  MenuButton(
                                    isDelete: false,
                                    text: 'Open task',
                                    icon: FontAwesomeIcons.search,
                                    click: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => OpenTask(task: task),
                                        ),
                                      );
                                    },
                                  ),
                                  MenuButton(
                                    isDelete: false,
                                    text: 'Update task',
                                    icon: FontAwesomeIcons.edit,
                                    click: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => UpdateTask(task: task, trash: false),
                                        ),
                                      );
                                    },
                                  ),
                                  Divider(color: Colors.red),
                                  MenuButton(
                                    isDelete: true,
                                    text: 'Delete task',
                                    icon: FontAwesomeIcons.trash,
                                    click: () {
                                      setState(() {
                                        DatabaseService.instance.update(
                                          Task(
                                            row: task.row,
                                            id: task.id,
                                            date: task.date,
                                            name: task.name,
                                            note: task.note,
                                            status: 'trash',
                                          ),
                                        );
                                      });
                                      Navigator.of(context).pop();
                                      sendToast('Task moved to trash', true);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
                            DatabaseService.instance.update(
                              Task(
                                row: task.row,
                                id: task.id,
                                date: task.date,
                                name: task.name,
                                note: task.note,
                                status: 'trash',
                              ),
                            );
                          });
                          sendToast('Task moved to trash', true);
                        } else {
                          setState(() {
                            DatabaseService.instance.update(
                              Task(
                                row: task.row,
                                id: task.id,
                                date: task.date,
                                name: task.name,
                                note: task.note,
                                status: 'home',
                              ),
                            );
                          });
                          sendToast('Task moved to home', true);
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
                ).toList(),
              );
      },
    );
  }
}
