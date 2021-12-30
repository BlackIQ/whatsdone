import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuButton extends StatelessWidget {
  MenuButton({
    this.text,
    this.click,
    this.icon,
    this.isDelete,
  });

  final text;
  final click;
  final icon;
  final isDelete;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: click,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FaIcon(
            icon,
            color: isDelete ? Colors.red : Colors.deepPurple,
            size: 15,
          ),
          Text(
            text,
            style: TextStyle(
              color: isDelete ? Colors.red : Colors.deepPurple,
            ),
          )
        ],
      ),
    );
  }
}
