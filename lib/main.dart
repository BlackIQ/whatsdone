import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsdone/app/screens/home/home.dart';
import 'package:whatsdone/app/screens/landing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landing(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.patrickHandTextTheme(),
      ),
    );
  }
}