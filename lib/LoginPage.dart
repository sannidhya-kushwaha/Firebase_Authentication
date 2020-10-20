import 'package:firebase/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';
import 'package:flutter/material.dart';
import 'SignupPage.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/LoginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0), //65...........original
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "images/crop2.png",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(34.0),

                    ///34..............org
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontSize: 15.0,
                            //   fontFamily: 'Futura',
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Enter your login info to sign in your account",
                            style: TextStyle(
                              fontSize: 10.0,
                              //    fontFamily: 'Futura',
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        new SizedBox(height: 20.0),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontSize: 13.0,

                            //      fontFamily: 'Futura',
                          ),
                          decoration: InputDecoration(
                            hintText: 'User Name | Ad. no. | Mail | Ph. no.',
                            //     fillColor: Colors.deepPurpleAccent[100],
                            //     filled: false,
                            contentPadding:
                                EdgeInsets.fromLTRB(17.0, 5.0, 10.0, 5.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                        new SizedBox(height: 20.0),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 13.0,
                            //       fontFamily: 'Futura',
                          ),
                          decoration: InputDecoration(
                            hintText: 'Your Password',
                            //       fillColor: Colors.deepPurpleAccent[100],
                            //       filled: false,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                        new SizedBox(height: 30.0),
                        new RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.deepPurpleAccent),
                            ),
                            child: new Text(
                              "Login",
                              style: new TextStyle(
                                fontSize: 15.0,
                                //       fontFamily: 'Futura',
                              ),
                            ),
                            textColor: Colors.white,
                            color: Color(0xFF9966cc),
                            onPressed: () {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _email, password: _password)
                                  .then((user) {
                                Navigator.of(context)
                                    .pushReplacementNamed(HomePage.routeName);
                              }).catchError((e) {
                                print(e);
                              });
                            }),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: new FlatButton(
                            child: new Text(
                              "New User?",
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Color(0xFF9966cc),
                                //     fontFamily: 'Futura',
                              ),
                            ),
                            textColor: Colors.deepPurpleAccent,
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(SignupPage.routeName);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
