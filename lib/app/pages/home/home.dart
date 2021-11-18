import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> itemsList = [
    'A',
    'B',
    'C',
    'D',
  ];

  @override
  Widget build(BuildContext context) {
    return itemsList.length > 0
        ? ListView.separated(
            itemCount: itemsList.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                child: ListTile(
                  title: Container(
                    // padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    // color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('${itemsList[index]}'),
                        SizedBox(height: 5),
                        Text(
                          'Date',
                          style: TextStyle(fontSize: 12, color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    itemsList.removeAt(index);
                  });
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
                    Icons.cancel,
                    color: Colors.white,
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(color: Colors.deepPurple),
          )
        : Center(
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
          );
  }
}
