import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Trash extends StatefulWidget {
  @override
  _TrashState createState() => _TrashState();
}

class _TrashState extends State<Trash> {
  List<Map> x = [
    {
      'name': 'amir',
      'date': 'amir',
    },
  ];

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
      body: ListView.builder(
        itemCount: x.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            child: ListTile(
              title: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(x[index]['name']),
                    SizedBox(height: 5),
                    Text(
                      x[index]['date'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onDismissed: (direction) {
              print('Delete');
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
      ),
    );
  }
}
