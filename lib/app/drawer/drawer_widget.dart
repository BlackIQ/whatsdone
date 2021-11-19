import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:whatsdone/app/drawer/items/drawer_item.dart';
import 'package:whatsdone/app/index.dart';
import 'package:whatsdone/app/routes/developer.dart';
import 'package:whatsdone/app/routes/trash.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
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
          ),
          Divider(color: Colors.deepPurple),
          DrawerItemWidget(
            text: 'App',
            icon: Icons.android,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WhatsDone())),
          ),
          DrawerItemWidget(
            text: 'Trash',
            icon: Icons.delete,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Trash())),
          ),
          DrawerItemWidget(
            text: 'About app',
            icon: Icons.perm_device_information,
            onTap: () => showAboutDialog(context: context),
          ),
          DrawerItemWidget(
            text: 'about developer',
            icon: Icons.laptop_mac,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Developer())),
          ),
          DrawerItemWidget(
            text: 'Exit',
            icon: Icons.exit_to_app,
            onTap: () => exit(0),
          ),
        ],
      ),
    );
  }
}
