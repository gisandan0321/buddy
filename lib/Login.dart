

import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {

  static String tag = "/login";

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {

  Widget build(BuildContext context) {
    return new ListView(
      padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
      children: <Widget>[
        new Text("Login Page",
          textAlign: TextAlign.center,
        ),
        new SizedBox(height: 20),
        new Text("Just add any widget below or replace this centered text widget",
          textAlign: TextAlign.center,
        ),
        new SizedBox(height: 20),
        new Text("Press the back button of your phone to go back to the previous screen",
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}