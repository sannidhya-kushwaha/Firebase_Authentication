import 'package:flutter/material.dart';

import 'loginPage.dart';
import 'SignupPage.dart';

import 'HomePage.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firebase Auth",
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
      routes: {
        SignupPage.routeName: (ctx) => SignupPage(),
        LoginPage.routeName: (ctx) => LoginPage(),
        HomePage.routeName: (ctx) => HomePage(),
      },
    );
  }
}
