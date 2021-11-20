import 'dart:convert';
import 'dart:async';
import 'dart:io';

var filename = 'x.json';
Map items = jsonDecode(filename);

void done(int row) {
  items['tasks'][row]['status'] = 'done';
}

void trash(int row) {
  items['tasks'][row]['status'] = 'trash';
}

void home(int row) {
  items['tasks'][row]['status'] = 'home';
}

void delete(int row) {
  items['tasks'][row]['status'] = 'deleted';
}