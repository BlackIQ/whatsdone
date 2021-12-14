import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItems extends StatelessWidget {
  DrawerItems({
    @required this.text,
    @required this.icon,
    @required this.onTap,
  });

  final text;
  final icon;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Row(
        children: <Widget>[
          FaIcon(
            icon,
            color: Colors.deepPurple,
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.deepPurple,
            ),
          )
        ],
      ),
    );
  }
}
