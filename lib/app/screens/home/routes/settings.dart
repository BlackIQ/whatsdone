import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings extends StatelessWidget {
  List<Map> items = [
    {
      'title': 'General settings',
      'details': 'General settings includes app font, color and etc',
      'route': Colors.red,
      'leading': FontAwesomeIcons.cog,
    },
    {
      'title': 'Theme settings',
      'details': 'Theme settings for dark or light mode',
      'route': Colors.red,
      'leading': FontAwesomeIcons.adjust,
    },
    {
      'title': 'Task font settings',
      'details': 'Font settings for Task. Like note, title and etc',
      'route': Colors.red,
      'leading': FontAwesomeIcons.font,
    },
    {
      'title': 'Task color settings',
      'details': 'Color settings for Task. Color of texts',
      'route': Colors.red,
      'leading': FontAwesomeIcons.palette,
    },
    {
      'title': 'Account settings',
      'details': 'Account settings. To manage your account',
      'route': Colors.red,
      'leading': FontAwesomeIcons.userAlt,
    },
    {
      'title': 'Data settings',
      'details': 'Storage settings. Clean cache, remove every thing and reset',
      'route': Colors.red,
      'leading': FontAwesomeIcons.database,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Settings'),
      ),
      body: ListView.separated(
        separatorBuilder: (index, context) => SizedBox(height: 5),
        padding: EdgeInsets.all(20),
        itemCount: items.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            items[index]['title'],
            style: TextStyle(
              fontSize: 17,
              color: Colors.deepPurple,
            ),
          ),
          subtitle: Text(
            items[index]['details'],
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          leading: Container(
            width: 40,
            child: Center(
              child: FaIcon(
                items[index]['leading'],
                color: Colors.deepPurple,
                size: 20,
              ),
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.deepPurple,
            ),
            onPressed: () {
              return items[index]['route'];
            },
          ),
          tileColor: Colors.white,
        ),
      ),
    );
  }
}
