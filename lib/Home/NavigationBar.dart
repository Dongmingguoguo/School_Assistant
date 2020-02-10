import 'package:final_project/Home/HomePage.dart';
import 'package:final_project/Home/NavigationIconView.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Home/NavigationIconView.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Help_Center/Upload.dart';
import 'package:final_project/menu/Menu.dart';

class NavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _NavigationBar();
}

class _NavigationBar extends State<NavigationBar>
    with TickerProviderStateMixin {
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
        title: new Text('Home'),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.home),
        title: new Text('Home'),
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
