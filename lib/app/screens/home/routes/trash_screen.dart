import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsdone/app/screens/home/routes/review_tak_page.dart';
import 'package:whatsdone/app/screens/home/routes/update_screen.dart';
import 'package:whatsdone/app/services/database.dart';
import 'package:whatsdone/app/models/task.dart';
import 'package:whatsdone/app/widgets/buttons/menu_button.dart';
import 'package:whatsdone/app/widgets/modal/modalbottom.dart';
import 'package:whatsdone/app/widgets/toast.dart';

class Trash extends StatefulWidget {
  @override
  _TrashState createState() => _TrashState();
}

class _TrashState extends State<Trash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Trash',
          style: GoogleFonts.patrickHand(),
        ),
      ),
      body: FutureBuilder<List<Task>>(
        future: DatabaseService.instance.getTasks('trash'),
        builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          return snapshot.data.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Trash is empty',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'Well done',
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
                              modalBottom(context, task.name, task.note, true),
                          onLongPress: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MenuButton(
                                      isDelete: false,
                                      text: 'Review task',
                                      icon: FontAwesomeIcons.boxOpen,
                                      click: () {
                                        modalBottom(context, task.name,
                                            task.note, true);
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
                                                task: task, trash: true),
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
                                          DatabaseService.instance
                                              .remove(task.id);
                                        });
                                        Navigator.of(context).pop();
                                        sendToast(
                                            'Task removed from database', true);
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
                              color: Colors.red,
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
                          setState(() {
                            DatabaseService.instance.remove(task.id);
                          });
                          sendToast('Task is deleted from database', true);
                        },
                        background: Container(
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
      ),
    );
  }
}
