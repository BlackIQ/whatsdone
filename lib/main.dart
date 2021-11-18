import 'package:flutter/material.dart';
import 'package:whatsdone/app/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhatsDone(),
      theme: ThemeData(
        // textTheme: GoogleFonts.boogalooTextTheme(),
        // backgroundColor: Colors.white,
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}