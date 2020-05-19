
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
  TabController innerTabController;

  bool isLoggedIn = false;
  String view = "";
  bool replaceSearchPageWithProfilePage = false;

  @override
  void initState() {
    tabController = new TabController(length: 2, vsync: this, initialIndex: 0);
    tabController.addListener(onTabClick);
    innerTabController = new TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  void onTabClick() {
    setState(() {
      view = "";
    });
  }

  // Search Route
  searchRoute() async { // async - to set the function as asynchronous
    // await - to wait the new route to end
    var response = await Navigator.push(context, SlideLeft(page: Search()));
    if (response != null) { // If Search Page has a return value
      setState(() { // setState - to notify the view that we will be showing the profile screen
        replaceSearchPageWithProfilePage = true;
      });
    }
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
        } else if (replaceSearchPageWithProfilePage) {
          setState(() {
            replaceSearchPageWithProfilePage = false;
          });
          return false;
        } else {
        return true;
        }
      },
      child: new Scaffold(
        appBar: (replaceSearchPageWithProfilePage) ? new AppBar(
          title: new Container(
            height: 40,
            child: new TextField(
              keyboardType: TextInputType.text,
              autofocus: false,
              focusNode: new AlwaysDisabledFocusNode(),
              onChanged: (value) {
                setState(() {
                  searchRoute(); // Route to search page again
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
              cursorColor: Colors.orange,
            ),
          ),
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios),
              onPressed: () {
                setState(() {
                  replaceSearchPageWithProfilePage = false; // Hide the profile screen and show back the search screen
                });
              }
          ),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.favorite_border),
                onPressed: () {
                  // Favorite Action Here
                }
            )
          ],
          elevation: 0, // Hide the shadow
          backgroundColor: Colors.white,
          bottom: new PreferredSize(
              child: new Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: new TabBar(
                    controller: innerTabController,
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Theme.of(context).accentColor,
                            width: 2.0
                        ),
                      ),
                    ),
                    labelColor: Colors.orange,
                    unselectedLabelColor: Colors.grey,
                    tabs: <Widget>[
                      new Tab(text: "Tab 1"),
                      new Tab(text: "Tab 2"),
                    ]
                ),
              ),
              preferredSize: new Size(MediaQuery.of(context).size.width, 48)
          ),
        ) : null, // null - if screen is search and show the app bar if screen is profile page
        body: TabBarView(
          children: <Widget>[
            (replaceSearchPageWithProfilePage) ? new TabBarView(
              controller: innerTabController,
              children: <Widget>[
                new Center(child: new Text("Inner Tab 1")), // Load Screen Here
                new Center(child: new Text("Inner Tab 2")) // Load Screen Here
              ],
            ) : // Show Profile Screen and show tab bar view in the action bar
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
                      searchRoute();
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