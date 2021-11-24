import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Trash extends StatefulWidget {
  @override
  _TrashState createState() => _TrashState();
}

class _TrashState extends State<Trash> {
  List<Map> itemsList = [
    {'name': 'Issues in Trash', 'date': 'Nov 15 2021'},
    {'name': 'Watch HIMYM', 'date': 'Nov 21 2021'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          'Trash',
          style: GoogleFonts.patrickHand(),
        ),
      ),
      body: itemsList.length > 0
          ? ListView.separated(
        itemCount: itemsList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            child: ListTile(
              title: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${itemsList[index]['name']}'),
                    SizedBox(height: 5),
                    Text(
                      '${itemsList[index]['date']}',
                      style: TextStyle(fontSize: 12, color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                setState(() {
                  itemsList.removeAt(index);
                });
              }
              else {
                // Un Done
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
        separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.red),
      )
          : Center(
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
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
