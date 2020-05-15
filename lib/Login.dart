

import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {

  static String tag = "/login";

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {

  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Center(
          child: new Text("Just add any widget below or replace this centered text widget"),
        )
      ],
    );
  }
}