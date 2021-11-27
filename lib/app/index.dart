import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsdone/app/drawer/drawer_widget.dart';
import 'package:whatsdone/app/navigator/button_navigator.dart';
import 'package:whatsdone/app/pages/add/add.dart';
import 'package:whatsdone/app/pages/done/done.dart';
import 'package:whatsdone/app/pages/home/home.dart';

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
      bottomNavigationBar: BottomNavigatorWidget(
        change: changePage,
        selected: _selectedIndex,
      ),
    );
  }
}
