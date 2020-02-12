import 'package:flutter/material.dart';
import 'package:final_project/BBS/bbs.dart';

class Todolist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Todolist();
  }
}

class _Todolist extends State<Todolist> {
  Widget todolist() {
    return new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: new Container(
        color: Colors.white,
        padding: new EdgeInsets.all(15.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "date",
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
                new Text(
                  "time",
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            new Image.asset("images/google.png"),
            SizedBox(
              height: 10.0,
            ),
            new Text(
              "description",
              style: Theme.of(context).textTheme.subhead,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget assignment() {
    return new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: new Container(
        color: Colors.white,
        padding: new EdgeInsets.all(15.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "date",
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
                new Text(
                  "time",
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            new Image.asset("images/google.png"),
            SizedBox(
              height: 10.0,
            ),
            new Text(
              "description",
              style: Theme.of(context).textTheme.subhead,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget Course() {
    return new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: new FlatButton(
          onPressed: () {
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) {
              return new BBS();
            }));
          },
          child: new Container(
            color: Colors.white,
            padding: new EdgeInsets.all(15.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "date",
                      style: Theme.of(context).textTheme.subtitle,
                      textAlign: TextAlign.center,
                    ),
                    new Text(
                      "time",
                      style: Theme.of(context).textTheme.subtitle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                new Image.asset("images/google.png"),
                SizedBox(
                  height: 10.0,
                ),
                new Text(
                  "description",
                  style: Theme.of(context).textTheme.subhead,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )),
    );
  }

  Widget Assignment() {
    return new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: new FlatButton(
          onPressed: () {
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) {
              return new BBS();
            }));
          },
          child: new Container(
            color: Colors.white,
            padding: new EdgeInsets.all(15.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "date",
                      style: Theme.of(context).textTheme.subtitle,
                      textAlign: TextAlign.center,
                    ),
                    new Text(
                      "time",
                      style: Theme.of(context).textTheme.subtitle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                new Image.asset("images/google.png"),
                SizedBox(
                  height: 10.0,
                ),
                new Text(
                  "description",
                  style: Theme.of(context).textTheme.subhead,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          child:
              new Column(children: <Widget>[
                Assignment(),
                Course()
                
                
                ]),
        ),
      ),
    );
  }
}
