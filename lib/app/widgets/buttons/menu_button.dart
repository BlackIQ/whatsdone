import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuButton extends StatelessWidget {
  MenuButton({
    this.text,
    this.click,
    this.icon,
  });

  final text;
  final click;
  final icon;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: click,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FaIcon(
            icon,
            color: Colors.deepPurple,
            size: 15,
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
