import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Sign in to Whats Done',
          style: GoogleFonts.patrickHand(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              'Welcome to',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 30,
              ),
            ),
            // SizedBox(height: 10),
            Text(
              'Whats Done',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 50,
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: FlatButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.deepPurple,
                    ),
                    Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'You should sign in to continue to the app',
              style: TextStyle(
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
