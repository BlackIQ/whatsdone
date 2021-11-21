import 'package:flutter/material.dart';

class BuildWhatsDoneList extends StatelessWidget {
  BuildWhatsDoneList({@required this.wdlist, @required this.toright, @required this.toleft, @required this.rightbg, @required this.leftbg});
  final wdlist;
  final toright;
  final toleft;
  final rightbg;
  final leftbg;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: wdlist.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          child: ListTile(
            title: Container(
              margin: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('${wdlist[index]['name']}'),
                  SizedBox(height: 5),
                  Text(
                    '${wdlist[index]['date']}',
                    style: TextStyle(fontSize: 12, color: Colors.deepPurple),
                  ),
                ],
              ),
            ),
          ),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              toleft;
            } else {
              toright;
            }
          },
          background: leftbg,
          secondaryBackground: rightbg,
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          Divider(color: Colors.deepPurple),
    );
  }
}
