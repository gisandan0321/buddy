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
                prefixIcon: new Icon(Icons.search, color: Colors.black,),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(color: Colors.transparent)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              cursorColor: Colors.blue,
            ),
          ),
          leading: null,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel"
              ),
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: new Center(
          child: new Text("Search Result here"),
        )
    );
  }

}