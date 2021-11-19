import 'package:flutter/material.dart';

class DoneTasks extends StatefulWidget {
  @override
  _DoneTasksState createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  List<Map> itemsList = [];

  // void check() {
  //   for (int counter = 0; counter < allItems.length; counter++) {
  //     if (allItems[counter]['status'] == 'done') {
  //       setState(() {
  //         itemsList.add(allItems[counter]);
  //       });
  //     }
  //   }
  // }

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
                    // delete(index);
                  }
                  else {
                    // home(index);
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
            separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.deepPurple),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You did everything',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.green,
                  ),
                ),
                Text(
                  'congratulations',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          );
  }
}
