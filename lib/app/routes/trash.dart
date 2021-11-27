import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsdone/app/data/data.dart';

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
      body: FutureBuilder<List<Tasks>>(
        future: DatabaseHelper.instance.getTrash(),
        builder: (BuildContext context, AsyncSnapshot<List<Tasks>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            );
          }
          return snapshot.data!.isEmpty
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
                  children: snapshot.data!.map((task) {
                    return Center(
                      child: Dismissible(
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
                                      fontSize: 12, color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onDismissed: (direction) async {
                          if (direction == DismissDirection.endToStart) {
                            // TODO: Insert in trash
                            // TODO: Delete in home
                          } else {
                            // TODO: Insert in done
                            // TODO: Delete in home
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
                      ),
                    );
                  }).toList(),
                );
        },
      ),
    );
  }
}
