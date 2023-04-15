import 'package:flutter/material.dart';
import 'package:resume_builder/Screen/homeScreen.dart';
import 'package:resume_builder/Screen/saveScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
    '/':(context) => Dash(),
    'Save':(context) => SecondPage(),
  },
  ));
}
