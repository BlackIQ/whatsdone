import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:whatsdone/app/screens/home/routes/review_tak_page.dart';
import 'package:whatsdone/app/screens/home/routes/update_screen.dart';
import 'package:whatsdone/app/services/database.dart';
import 'package:whatsdone/app/models/task.dart';
import 'package:whatsdone/app/widgets/buttons/menu_button.dart';
import 'package:whatsdone/app/widgets/modal/modalbottom.dart';
import 'package:whatsdone/app/widgets/toast.dart';

class NotDone extends StatefulWidget {
  @override
  _NotDoneState createState() => _NotDoneState();
}

class _NotDoneState extends State<NotDone> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
      future: DatabaseService.instance.getTasks('home'),
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
            : ListView(
                children: snapshot.data.map(
                  (task) {
                    return Dismissible(
                      key: UniqueKey(),
                      child: ListTile(
                        onTap: () =>
                            modalBottom(context, task.name, task.note, false),
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
                                      modalBottom(
                                          context, task.name, task.note, true);
                                    },
                                  ),
                                  MenuButton(
                                    isDelete: false,
                                    text: 'Open task',
                                    icon: FontAwesomeIcons.search,
                                    click: () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => OpenTask(
                                              task: task, trash: false),
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
                                          builder: (context) => UpdateTask(
                                              task: task, trash: false),
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
                                status: 'done',
                              ),
                            );
                          });
                          sendToast('Task is now done', true);
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
                  },
                ).toList(),
              );
      },
    );
  }
}
