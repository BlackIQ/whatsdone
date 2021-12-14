import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsdone/app/screens/home/routes/developer.dart';
import 'package:whatsdone/app/screens/home/routes/trash.dart';
import 'package:whatsdone/app/screens/home/tabs/add.dart';
import 'package:whatsdone/app/screens/home/tabs/done.dart';
import 'dart:io';

import 'package:whatsdone/app/widgets/drawer/drawer_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset(
                    'asset/logo.png',
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Whats Done!?',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      Text(
                        'Track your TODOs with me!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.deepPurple),
            DrawerItems(
              text: 'App',
              icon: Icons.android,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
            ),
            DrawerItems(
              text: 'Trash',
              icon: Icons.delete,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => Trash(),
                ),
              ),
            ),
            DrawerItems(
              text: 'About app',
              icon: Icons.perm_device_information,
              onTap: () => showAboutDialog(
                context: context,
                applicationIcon: Image.asset(
                  'asset/logo.png',
                  height: 50,
                  width: 50,
                ),
                applicationVersion: '1.0.0',
                applicationName: 'Whats Done!?',
                applicationLegalese: 'Track your TODOs with Whats Done.',
                children: [
                  SizedBox(height: 20),
                  Divider(color: Colors.deepPurple),
                  Text(
                    'Who is my developer!?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                    ),
                  ),
                  DrawerItems(
                    text: 'About developer',
                    icon: Icons.laptop_mac,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => Developer(),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Also check my website!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                    ),
                  ),
                  DrawerItems(
                    text: 'Open whatsdone.blackiq.ir',
                    icon: Icons.cloud,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            DrawerItems(
              text: 'Exit',
              icon: Icons.exit_to_app,
              onTap: () => exit(0),
            ),
          ],
        ),
      ),
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
