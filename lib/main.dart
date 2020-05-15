import 'package:flutter/material.dart';

import 'Home.dart';
import 'Search.dart';

void main() {

  // Page routes
  final routes = <String, WidgetBuilder>{
    Home.tag: (context) => Home(),
    Search.tag: (context) => Search(),
  };

  runApp(MaterialApp(
    title: "Buddy",
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blue,
        brightness: Brightness.light,
        dialogBackgroundColor: Colors.white
      // or Colors.green or any color darker than white (this is line 66)
    ),
    home: new Home(),
    initialRoute: "/",
    routes: routes,
  ));
}