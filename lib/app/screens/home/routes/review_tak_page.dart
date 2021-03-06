import 'package:flutter/material.dart';
import 'package:whatsdone/app/screens/home/home.dart';
import 'package:whatsdone/app/screens/home/routes/trash_screen.dart';

class OpenTask extends StatelessWidget {
  OpenTask({
    this.task,
    this.trash,
  });

  final task;
  final trash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(task.name),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => trash ? Trash() : Home(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
              ),
            ),
            Divider(color: Colors.deepPurple),
            Text(
              task.note,
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Task status stage',
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
                Text(
                  task.status,
                  style: TextStyle(
                    color: task.status == 'home'
                        ? Colors.blue
                        : task.status == 'trash'
                            ? Colors.red
                            : Colors.green,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date created',
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
                Text(
                  task.date,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Task ID',
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
                Text(
                  task.id.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
