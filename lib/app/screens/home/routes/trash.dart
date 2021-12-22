import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsdone/app/services/database.dart';
import 'package:whatsdone/app/models/task.dart';

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
                        setState(() {
                          DatabaseService.instance.remove(task.id);
                        });
                      },
                      background: Container(
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
      ),
    );
  }
}
