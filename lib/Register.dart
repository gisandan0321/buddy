

import 'package:flutter/cupertino.dart';

class Register extends StatefulWidget {

  static String tag = "/register";

  @override
  _RegisterState createState() => new _RegisterState();
}

class _RegisterState extends State<Register> {

  Widget build(BuildContext context) {
    return new ListView(
      padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
      children: <Widget>[
        new Text("Register Page",
          textAlign: TextAlign.center,
        ),
        new SizedBox(height: 20),
        new Text("Just add any widget below or replace this centered text widget",
          textAlign: TextAlign.center,
        ),
        new SizedBox(height: 20),
        new Text("Press the back button to go back of your phone to the previous screen",
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}