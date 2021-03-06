import 'package:whatsdone/app/services/authenticarion.dart';
import 'package:whatsdone/app/screens/landing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsdone/app/models/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Landing(),
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          textTheme: GoogleFonts.patrickHandTextTheme(),
        ),
      ),
    );
  }
}
