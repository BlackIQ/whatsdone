import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsdone/app/models/user.dart';
import 'package:whatsdone/app/screens/home/home.dart';
import 'package:whatsdone/app/screens/authentication/authentication.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user != null ? Home() : Authentication();
  }
}
