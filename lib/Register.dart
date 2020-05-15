

import 'package:flutter/cupertino.dart';

class Register extends StatefulWidget {

  static String tag = "/register";

  @override
  _RegisterState createState() => new _RegisterState();
}

class _RegisterState extends State<Register> {

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