import 'package:flutter/material.dart';
import 'package:whatsdone/app/navigator/button_navigator.dart';

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
    pageController.animateToPage(index, duration: Duration(milliseconds: 1000), curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whats Done!?'),
        centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        children: <Widget>[
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.blue),
        ],
      ),
      bottomNavigationBar: bNavigator(
        change: changePage,
        selected: _selectedIndex,
      ),
    );
  }
}
