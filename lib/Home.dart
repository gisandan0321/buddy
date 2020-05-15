
import 'package:buddy/Search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AlwaysDisabledFocusNode.dart';
import 'SlideLeft.dart';

class Home extends StatefulWidget {
  static String tag = '/home';

  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin  {

  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Buddy"),
      ),
      body: TabBarView(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(20),
            child: new TextField(
              keyboardType: TextInputType.text,
              autofocus: false,
              focusNode: new AlwaysDisabledFocusNode(),
              decoration: InputDecoration(
                hintText: 'Search here..',
                hintStyle: TextStyle(
                    color: Colors.black45
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                ),
              ),
              onTap: () {
                Navigator.push(context, SlideLeft(page: Search()));
              },
            ),
          ),
          new Center(
            child: new Text("Home"),
          )
        ],
        controller: tabController,
      ),
      bottomNavigationBar: new Container(
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.blue,
            boxShadow: [BoxShadow(
              color: Colors.grey,
            ),]
        ),
        child: new TabBar(
            controller: tabController,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.black45,
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.search)
              ),
              new Tab(
                  icon: new Icon(Icons.home)
              ),
            ]
        ),
      ),
    );
  }
}