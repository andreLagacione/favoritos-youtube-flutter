import 'package:flutter/material.dart';
import 'package:youtubefavoritos/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterTube',
      home: Home(),
    );
  }
}