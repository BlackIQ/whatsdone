import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void sendToast(String msg, bool long) => Fluttertoast.showToast(
      msg: msg,
      toastLength: long ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
    );
