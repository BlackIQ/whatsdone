import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  DrawerItemWidget({@required this.text, @required this.icon, @required this.onTap});
  final text;
  final icon;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Row(
        children: <Widget>[
          Icon(
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
