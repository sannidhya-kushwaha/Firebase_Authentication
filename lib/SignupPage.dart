import 'package:firebase/services/usernamangement.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  static const routeName = '/SignupPage';
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
              padding: const EdgeInsets.only(top: 50.0),
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      fontSize: 13.0,

                      //      fontFamily: 'Futura',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Name',
                      //     fillColor: Colors.deepPurpleAccent[100],
                      //     filled: false,
                      contentPadding: EdgeInsets.fromLTRB(17.0, 5.0, 10.0, 5.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
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
                      hintText: 'Mail | Ph. no.',
                      //     fillColor: Colors.deepPurpleAccent[100],
                      //     filled: false,
                      contentPadding: EdgeInsets.fromLTRB(17.0, 5.0, 10.0, 5.0),
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
                      hintText: 'Password',
                      //       fillColor: Colors.deepPurpleAccent[100],
                      //       filled: false,
                      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
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
                        "SignUp",
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
                            .then((signedinUser) {
                          UserManagement().storeNewUser(signedinUser, context);
                        }).catchError((e) {
                          print(e);
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: new FlatButton(
                      child: new Text(
                        "Uped User?",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Color(0xFF9966cc),
                          //     fontFamily: 'Futura',
                        ),
                      ),
                      textColor: Colors.deepPurpleAccent,
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LoginPage.routeName);
                        //Navigator.of(context).pushNamed(LoginPage.routeName);
                      },
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
