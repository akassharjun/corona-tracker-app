import 'package:coronatracker/ui/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID19',
      theme: ThemeData(
        fontFamily: 'TeXGryreAdventor',
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}