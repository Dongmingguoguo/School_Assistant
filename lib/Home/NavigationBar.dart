import 'package:final_project/Home/HomePage.dart';
import 'package:final_project/Home/NavigationIconView.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Home/NavigationIconView.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Help_Center/Upload.dart';
import 'package:final_project/menu/Menu.dart';
import 'Authentication.dart';


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

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _NavigationBar extends State<NavigationBar> with TickerProviderStateMixin {

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
      new HomePage(),
      new Upload(),
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

  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  Widget logout() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            margin:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            decoration: new BoxDecoration(
                color: Colors.white10,
                borderRadius: new BorderRadius.all(new Radius.circular(6.0))),
            child: new FlatButton(
                onPressed: () {},
                child: new Container(
                  child: new ListTile(
                    leading: new Container(
                      child: new CircleAvatar(
                          backgroundImage: new NetworkImage(
                              "https://pic1.zhimg.com/v2-ec7ed574da66e1b495fcad2cc3d71cb9_xl.jpg"),
                          radius: 20.0),
                    ),
                    title: new Container(
                      margin: const EdgeInsets.only(bottom: 2.0),
                      child: new Text("learner"),
                    ),
                    subtitle: new Container(
                      margin: const EdgeInsets.only(top: 2.0),
                      child: new Text("查看或编辑个人主页"),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
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
      onTap: (int index){
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
        });
      }
    );

    return new MaterialApp(
      
      home: new Scaffold(
        body: new Center(
          child: _currentPage
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),

    );

   
  }
}
