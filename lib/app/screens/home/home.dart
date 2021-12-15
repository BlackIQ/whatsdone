import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whatsdone/app/models/user.dart';
import 'package:whatsdone/app/screens/home/routes/developer.dart';
import 'package:whatsdone/app/screens/home/routes/trash.dart';
import 'package:whatsdone/app/screens/home/tabs/add.dart';
import 'package:whatsdone/app/screens/home/tabs/done.dart';
import 'package:whatsdone/app/screens/home/tabs/not.dart';
import 'package:whatsdone/app/services/authenticarion.dart';
import 'dart:io';

import 'package:whatsdone/app/widgets/drawer/drawer_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  int _selectedIndex = 0;
  PageController pageController = PageController();

  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // pageController.jumpToPage(index);
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 1000), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.dstATop,
                  ),
                  image: NetworkImage(
                    'https://cdn.wallpapersafari.com/64/43/0n5pUs.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(user.profile),
                        radius: 25,
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            user.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    user.email,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            DrawerItems(
              text: 'App',
              icon: FontAwesomeIcons.android,
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home())),
            ),
            DrawerItems(
              text: 'Trash',
              icon: FontAwesomeIcons.trash,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => Trash(),
                ),
              ),
            ),
            DrawerItems(
              text: 'About app',
              icon: FontAwesomeIcons.mobileAlt,
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
              ),
            ),
            DrawerItems(
              text: 'Development',
              icon: FontAwesomeIcons.tools,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => Developer(),
                ),
              ),
            ),
            DrawerItems(
              text: 'Exit',
              icon: FontAwesomeIcons.signOutAlt,
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
        actions: [
          FlatButton(
            onPressed: () async {
              return _auth.signOut();
            },
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        children: <Widget>[
          NotDone(),
          AddTask(),
          DoneTasks(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changePage,
        backgroundColor: Colors.grey[200],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.plus,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.check,
            ),
            label: 'Done',
          ),
        ],
      ),
    );
  }
}
