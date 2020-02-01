import 'package:final_project/Register/LoginRegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Home/Authentication.dart';



class HomePage extends StatefulWidget
{
  final AuthImplementation auth;
  final VoidCallback onSignedOut;
  
  HomePage
  ({
    this.auth,
    this.onSignedOut,
  });

  

  @override
    State<StatefulWidget> createState()
    {
      return _HomePageState();
    }
}

class _HomePageState extends State<HomePage>
{


  void _logoutUser() async
  {
    try
    {
      await widget.auth.signOut();
      widget.onSignedOut();
    }
    catch(e)
    {
      print(e.toString());

    }
    


  }


  @override
    Widget build(BuildContext context)
    {
      return new Scaffold
      (
        appBar: new AppBar
        (
          title: new Text("Home"),
        ),

        body: new Container
        (

        ),

        bottomNavigationBar: new BottomAppBar
        (
          color: Colors.blue,

          child: new Container
          (
            margin: const EdgeInsets.only(left: 50.0, right: 50.0),



            child: new Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,

              children: <Widget>
              [
                new IconButton
                (
                  icon: new Icon(Icons.local_car_wash),
                  iconSize: 50,
                  color: Colors.white,
                  
                  onPressed: _logoutUser,
                ),

                new IconButton
                (
                  icon: new Icon(Icons.alarm),
                  iconSize: 50,
                  color: Colors.white,
                  
                  onPressed: null,
                ),

                 new IconButton
                (
                  icon: new Icon(Icons.add_a_photo),
                  iconSize: 40,
                  color: Colors.white,
                                                      
                  onPressed: null,

                ),


              ],
            ),
          ),
        ),
      );
    }
}