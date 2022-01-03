import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsdone/app/services/authenticarion.dart';
import 'dart:io';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final AuthService _auth = AuthService();

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
            SizedBox(height: 40),
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final result = await InternetAddress.lookup('google.com');
                    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                      dynamic result = await _auth.googleLogin();
                      if (result.runtimeType == List) {
                        return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              'Something went wrong',
                              style: TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                            content: Text(
                              result[1],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Ok',
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                            ],
                            elevation: 0,
                          ),
                          barrierDismissible: false,
                        );
                      }
                    }
                  } catch (e) {
                    return showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Something went wrong',
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                        content: Text(
                          'It seems there is no internet connection.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Ok',
                              style: TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                        elevation: 0,
                      ),
                      barrierDismissible: false,
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.google,
                    ),
                    Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final result = await InternetAddress.lookup('google.com');
                    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                      dynamic result = await _auth.anonLogin();
                      if (result.runtimeType == List) {
                        return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                              'Something went wrong',
                              style: TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                            content: Text(
                              result[1],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'Ok',
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                            ],
                            elevation: 0,
                          ),
                          barrierDismissible: false,
                        );
                      }
                    }
                  } catch (e) {
                    return showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Something went wrong',
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                        content: Text(
                          'It seems there is no internet connection.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Ok',
                              style: TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                        elevation: 0,
                      ),
                      barrierDismissible: false,
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.userSecret,
                    ),
                    Text(
                      'Sign in as guest',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
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
