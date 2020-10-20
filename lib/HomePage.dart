import 'package:firebase/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Do you really want to exit the app?"),
        actions: <Widget>[
          FlatButton(
            child: Text('No'),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: (Colors.deepPurpleAccent),
          // actions: <Widget>[
          //   IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          // ],
          brightness: Brightness.dark,
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurpleAccent),
                accountName: Text("Sannidhya Kushwaha"),
                accountEmail: Text("sannidhyakushwaha@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  child: Text("S"),
                  backgroundColor: Colors.white,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Account'),
                subtitle: Text('Personal'),
                trailing: Icon(Icons.edit),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text('sannidhyakushwaha@gmail.com'),
                trailing: Icon(Icons.edit),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text('Checkout'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  FirebaseAuth.instance
                      .signOut()
                      .then((value) {})
                      .catchError((e) {
                    print(e);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
