import 'package:flutter/material.dart';
import 'package:whatsdone/app/screens/home/home.dart';
import 'package:whatsdone/app/screens/authentication/authentication.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = 'null';
    return user != null ? Home() : Authentication();
  }
}
