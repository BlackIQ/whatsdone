import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Developer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About developer',
          style: GoogleFonts.patrickHand(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Amirhossein Mohamamdi',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            Text(
              'Full Stack Developer',
              style: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
              ),
            ),
            Divider(color: Colors.deepPurple, height: 30),
            Text(
              'Contact',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.deepPurple,
                ),
                SizedBox(width: 20),
                Text(
                  'me@blackiq.ir',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.deepPurple,
                ),
                SizedBox(width: 20),
                Text(
                  '+98 901 4784362',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
