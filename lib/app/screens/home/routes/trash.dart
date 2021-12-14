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
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(color: Colors.red);
        },
        itemCount: x.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            child: ListTile(
              subtitle: Text(x[index]['date']),
              title: Text(
                x[index]['name'],
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
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
