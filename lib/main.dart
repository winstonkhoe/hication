import 'package:flutter/material.dart';
import 'package:hication/views/pages/allTrips.dart';
import 'package:hication/views/pages/login.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: 
        ThemeData(fontFamily: 'Garamond',),
      home: LoginPage()
    );
  }
}