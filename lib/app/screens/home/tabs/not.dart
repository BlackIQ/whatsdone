import 'package:flutter/material.dart';

class NotDone extends StatefulWidget {
  @override
  _NotDoneState createState() => _NotDoneState();
}

class _NotDoneState extends State<NotDone> {
  List<Map> x = [
    {
      'name': 'amir',
      'date': 'amir',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return x.isEmpty
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
        : ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(color: Colors.deepPurple);
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
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    print('Go to trash');
                  } else {
                    print('Go to done');
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
          );
  }
}
