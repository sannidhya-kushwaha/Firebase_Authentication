import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase/HomePage.dart';
import 'package:firebase/LoginPage.dart';

class UserManagement {
  storeNewUser(user, context) {
    Firestore.instance
        .collection('/users')
        .add({'email': user.email, 'uid': user.uid}).then((value) {
      Navigator.of(context).pop();
      // Navigator.of(context).pushReplacementNamed(HomePage.routeName);
      Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
    }).catchError((e) {
      print(e);
    });
  }
}
