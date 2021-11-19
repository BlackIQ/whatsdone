import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map> itemsList = [];

  // void check() {
  //   for (int counter = 0; counter < allItems.length; counter++) {
  //     if (allItems[counter]['status'] == 'home') {
  //       setState(() {
  //         itemsList.add(allItems[counter]);
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return itemsList.length != 0
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
                    // trash(index);
                  }
                  else {
                    // done(index);
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
            separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.deepPurple),
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
