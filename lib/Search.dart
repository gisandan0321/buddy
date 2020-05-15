import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {

  static String tag = "/search";

  @override
  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<Search> {

  search() {
    // Do the search
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Container(
            height: 40,
            child: new TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              style: TextStyle(
                  color: Colors.black
              ),
              onSubmitted: (keyword) {
                search();
              },
              onChanged: (value) {
                setState(() {

                });
              },
              decoration: InputDecoration(
                hintText: "Search here...",
                labelStyle: new TextStyle(
                    color: Colors.grey
                ),
                hasFloatingPlaceholder: false,
                fillColor: Colors.white,
                filled: true,
                focusColor: Colors.black,
                contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              cursorColor: Colors.blue,
            ),
          ),
        ),
        body: new Center(
          child: new Text("Search Result here"),
        )
    );
  }

}