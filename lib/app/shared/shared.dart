import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setColor(String color) async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  _preferences.setString('color', Colors.red.toString());
}

Future<String> getColor() async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  return _preferences.getString('color');
}