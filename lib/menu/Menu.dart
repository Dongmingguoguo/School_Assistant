import 'package:final_project/Home/Mapping.dart';
import 'package:flutter/material.dart';
import 'package:final_project/menu/GlobalConfig.dart';
import 'package:final_project/Home/Authentication.dart';

class Menu extends StatefulWidget {
  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  Menu({
    this.auth,
    this.onSignedOut,
  });

  @override
  State<Menu> createState() => new _Menu();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _Menu extends State<Menu> {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  Widget infoCard() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            margin:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            decoration: new BoxDecoration(
                color: GlobalConfig.dark == true
                    ? Colors.white10
                    : new Color(0xFFF5F5F5),
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
                      child: new Text("DongmingGuo"),
                    ),
                    subtitle: new Container(
                      margin: const EdgeInsets.only(top: 2.0),
                      child: new Text("See your profile"),
                    ),
                  ),
                )),
          ),
          new Row(
            children: <Widget>[
              Expanded(
                child: Divider(),
              )
            ],
          ),
          new Container(
            margin:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            decoration: new BoxDecoration(
                color: GlobalConfig.dark == true
                    ? Colors.white10
                    : new Color(0xFFF5F5F5),
                borderRadius: new BorderRadius.all(new Radius.circular(6.0))),
            child: new FlatButton(
                onPressed: () {
                  new MappingPage();
                  print("Press the button");
                },
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
                      child: new Text("Log Out"),
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Menu'),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: new Container(
          child: new Column(
            children: <Widget>[
              infoCard(),
            ],
          ),
        ),
      ),
    );
  }
}
