import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsdone/app/screens/home/routes/settings/settings_route/account.dart';
import 'package:whatsdone/app/screens/home/routes/settings/settings_route/data.dart';
import 'package:whatsdone/app/screens/home/routes/settings/settings_route/general.dart';
import 'package:whatsdone/app/screens/home/routes/settings/settings_route/theme.dart';

class SettingsPage extends StatelessWidget {
  List<Map> items = [
    {
      'title': 'General settings',
      'details': 'General settings like font and others',
      'route': GeneralSettings(),
      'leading': FontAwesomeIcons.cog,
    },
    {
      'title': 'Theme settings',
      'details': 'Theme settings for dark or light mode',
      'route': ThemeSettings(),
      'leading': FontAwesomeIcons.adjust,
    },
    {
      'title': 'Account settings',
      'details': 'Account settings. To manage your account',
      'route': AccountSettings(),
      'leading': FontAwesomeIcons.userAlt,
    },
    {
      'title': 'Data settings',
      'details': 'Storage settings. Clean cache, remove every thing and reset',
      'route': DataSettings(),
      'leading': FontAwesomeIcons.database,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => items[index]['route'],
              ),
            ),
          ),
          tileColor: Colors.white,
        ),
      ),
    );
  }
}
