import 'package:final_project/Help_Center/Posts.dart';
import 'package:final_project/Home/NavigationIconView.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Home/Authentication.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  HomePage({
    this.auth,
    this.onSignedOut,
  });

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<Posts> postsList = [];
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;


  @override
  void initState() {
    super.initState();
    DatabaseReference postsRef =
        FirebaseDatabase.instance.reference().child("Posts");

    postsRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      postsList.clear();

      for (var individualKey in KEYS) {
        Posts posts = new Posts(
          DATA[individualKey]['image'],
          DATA[individualKey]['description'],
          DATA[individualKey]['date'],
          DATA[individualKey]['time'],
        );

        postsList.add(posts);
      }

      setState(() {
        print('Length : $postsList.length');
      });
    });
  }

  

  void _logoutUser() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e.toString());
    }
  }
  

  Widget PostsUI(String image, String description, String date, String time) {
    return new Card(
        elevation: 10.0,
        margin: EdgeInsets.all(15.0),
        child: new Container(
          padding: new EdgeInsets.all(14.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    date,
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
                  new Text(
                    time,
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              new Image.network(image, fit: BoxFit.cover),
              SizedBox(
                height: 10.0,
              ),
              new Text(
                description,
                style: Theme.of(context).textTheme.subhead,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }

  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: new Container(
          child: postsList.length == 0
              ? new Text("No blog Post available")
              : new ListView.builder(
                  itemCount: postsList.length,
                  itemBuilder: (_, index) {
                    return PostsUI(
                        postsList[index].image,
                        postsList[index].description,
                        postsList[index].date,
                        postsList[index].time);
                  },
                )),
      
    );
  }

  /*
  Widget xixi() {
    BoxDecoration myBoxDecoration() {
      return BoxDecoration(
        color: Color(0xFFFF7043),
        borderRadius: new BorderRadius.circular(30),
        border: Border.all(
          width: 1,
        ),
      );
    }
    return new Container(
      width: 1000,
      child: new Column(
        children: <Widget>[
          new Container(
            decoration: myBoxDecoration(),
            height: 400,
            width: 380,
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'dadadasd',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
   */
}
