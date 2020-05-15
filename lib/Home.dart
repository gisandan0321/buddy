
import 'package:buddy/Register.dart';
import 'package:buddy/Search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AlwaysDisabledFocusNode.dart';
import 'Login.dart';
import 'SlideLeft.dart';

class Home extends StatefulWidget {
  static String tag = '/home';

  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin  {

  TabController tabController;

  bool isLoggedIn = false;
  String view = "";

  @override
  void initState() {
    tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
    tabController.addListener(onTabClick);
    super.initState();
  }

  void onTabClick() {
    setState(() {
      view = "";
    });
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return new WillPopScope(
      onWillPop: () async {
        if (view.isNotEmpty) {
          setState(() {
            view = "";
          });
          return false;
        } else {
          return true;
        }
      },
      child: new Scaffold(
        body: TabBarView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new SizedBox(height: 50),
                // Your Logo Here
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
                        borderSide: BorderSide(color: Colors.orange, width: 1.0),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, SlideLeft(page: Search()));
                    },
                  ),
                )
              ],
            ),
            (isLoggedIn) ? new Center(
              child: new Text("Load the screen here"),
            ) : (view.isEmpty) ? new Center(
              child: new ListView(
                children: <Widget>[
                  new SizedBox(height: size.height - 200), // Replace with your widgets here
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        width: 150,
                        child: new OutlineButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            setState(() {
                              view = "login";
                            });
                          },
                          padding: EdgeInsets.all(14),
                          child: Text("Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16
                              )
                          ),
                        ),
                      ),
                      new SizedBox(width: 10),
                      new Container(
                        width: 150,
                        child: new RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            setState(() {
                              view = "register";
                            });
                          },
                          padding: EdgeInsets.all(14),
                          color: Colors.orange,
                          child: Text("Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16
                              )
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ): (view == "register") ? new Register() : new Login()
          ],
          controller: tabController,
        ),
        bottomNavigationBar: new Container(
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.black54,
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
      ),
    );
  }
}