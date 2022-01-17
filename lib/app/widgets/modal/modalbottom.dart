import 'package:flutter/material.dart';

void modalBottom(context, name, note, trash) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
    ),
    context: context,
    builder: (context) => SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: trash ? Colors.red : Colors.deepPurple,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Note',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          Text(
            note,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    ),
  );
}