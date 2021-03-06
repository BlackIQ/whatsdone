import 'package:whatsdone/app/screens/home/routes/development_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsdone/app/widgets/drawer/drawer_item.dart';
import 'package:whatsdone/app/screens/home/routes/trash_screen.dart';
import 'package:whatsdone/app/services/authenticarion.dart';
import 'package:whatsdone/app/screens/home/routes/done_tab.dart';
import 'package:whatsdone/app/screens/home/routes/not_tab.dart';
import 'package:whatsdone/app/screens/home/routes/add_tab.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsdone/app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:io';

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
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 1000),
      curve: Curves.ease,
    );
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
                        backgroundImage: user.profile != null ? NetworkImage(user.profile) : null,
                        child: Icon(Icons.person),
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
                            user.name != null ? user.name : 'Guest user',
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
                    user.email != null ? user.email : 'Guest has no Email',
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
                applicationVersion: '2.11.9',
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
              text: 'Whats new in 2.11.9',
              icon: FontAwesomeIcons.solidStar,
              onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  elevation: 0,
                  title: Text(
                    'Whats new in Whats Done 2.11.9',
                    style: TextStyle(
                      color: Colors.deepPurple,
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'No major update, just minors!'
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Updates',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '- Anonymous authentication',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '- Updating task',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '- Bottom task review',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '- Context menu',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '- Remove Firebase trackers',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('This version just has simple updates and there is not major update as we mentioned at the top. We are all working to create something great and simple without forgetting this is an open-source software.',),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        await launch('https://gnu-amir.medium.com/whats-done-2-11-9-99dc99aee842');
                      },
                      child: Text(
                        'Medium article about 2.11.7',
                        style: TextStyle(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Close',
                        style: TextStyle(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
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
          TextButton(
            onPressed: () async {
              return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.deepPurple,
                    ),
                  ),
                  content: Text(
                    'Sure to logout?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        return _auth.signOut();
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                  elevation: 0,
                ),
                barrierDismissible: false,
              );
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
        // backgroundColor: Colors.grey[100],
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
