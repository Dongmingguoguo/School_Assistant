import 'package:flutter/material.dart';
import 'package:final_project/Home/HomePage.dart';
import 'package:final_project/Navigation/NavigationIconView.dart';
import 'package:final_project/Help_Center/Upload.dart';
import 'package:final_project/menu/Menu.dart';
import 'package:final_project/Home/Authentication.dart';
import 'package:final_project/BBS/bbs.dart';
import 'package:final_project/Home/todolist.dart';

class NavigationBar extends StatefulWidget {
  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  NavigationBar({
    this.auth,
    this.onSignedOut,
  });
  @override
  State<StatefulWidget> createState() => new _NavigationBar();
}

class _NavigationBar extends State<NavigationBar>
    with TickerProviderStateMixin {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  @override
  void initState() {
    super.initState();

    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.assignment),
        title: new Text('Home'),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.add_alert),
        title: new Text('Assignment'),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.home),
        title: new Text('Me'),
        vsync: this,
      ),
    ];

    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    _pageList = <StatefulWidget>[
      new Todolist(),
      new BBS(),
      new Menu(),
    ];

    _currentPage = _pageList[_currentIndex];
  }

  void _rebuild() {
    setState(() {});
  }

  void _logoutUser() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: _navigationViews
            .map((NavigationIconView navigationIconView) =>
                navigationIconView.item)
            .toList(),
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _navigationViews[_currentIndex].controller.reverse();
            _currentIndex = index;
            _navigationViews[_currentIndex].controller.forward();
            _currentPage = _pageList[_currentIndex];
          });
        });

    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: new Text('School Assistant'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Upload()));
              },
            ),
            
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: _logoutUser,
            ),
          ],
        ),
        body: new Center(child: _currentPage),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
