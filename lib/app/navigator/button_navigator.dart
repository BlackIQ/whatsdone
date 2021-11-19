import 'package:flutter/material.dart';

class BottomNavigatorWidget extends StatelessWidget {
  BottomNavigatorWidget({@required this.change, @required this.selected});
  final change;
  final selected;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10,
      onTap: change,
      backgroundColor: Colors.grey[200],
      currentIndex: selected,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Done'),
      ],
    );
  }
}
