import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsdone/app/drawer/drawer_widget.dart';
import 'package:whatsdone/app/screens/home/tabs/add.dart';
import 'package:whatsdone/app/screens/home/tabs/done.dart';
import 'package:whatsdone/app/screens/home/tabs/home.dart';

class WhatsDone extends StatefulWidget {
  @override
  _WhatsDoneState createState() => _WhatsDoneState();
}

class _WhatsDoneState extends State<WhatsDone> {

  int _selectedIndex = 0;
  PageController pageController = PageController();

  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // pageController.jumpToPage(index);
    pageController.animateToPage(index, duration: Duration(milliseconds: 1000), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Whats Done!?',
          style: GoogleFonts.patrickHand(),
        ),
        centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        children: <Widget>[
          Home(),
          AddTask(),
          DoneTasks(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        onTap: changePage,
        backgroundColor: Colors.grey[200],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Done'),
        ],
      ),
    );
  }
}
