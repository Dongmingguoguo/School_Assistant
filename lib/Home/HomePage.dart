import 'package:final_project/Register/LoginRegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Home/Authentication.dart';
import 'package:final_project/Help_Center/Upload.dart';


class HomePage extends StatefulWidget{
  final AuthImplementation auth;
  final VoidCallback onSignedOut;
  
  HomePage({
    this.auth,
    this.onSignedOut,
  });

  @override
    State<StatefulWidget> createState(){
      return _HomePageState();
    }
}

class _HomePageState extends State<HomePage>{
  void _logoutUser() async{
    try{
      await widget.auth.signOut();
      widget.onSignedOut();
    }
    catch(e){
      print(e.toString());
    }
  }

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
    return new Container (
      
      width: 1000,
      
      child: new Column(
        
        children: <Widget>[
          new Container(
            
            decoration: myBoxDecoration(),
            height: 400,
            width: 380,
             margin: const EdgeInsets.all(10.0),
             padding: const EdgeInsets.all(10.0),
            child: Text('dadadasd', textAlign: TextAlign.center,),
            
          ),
          
        ],
      ),

    );
  }


  @override
    Widget build(BuildContext context){
      return new Scaffold(
        appBar: new AppBar(
          


        ),
        
        body: new SingleChildScrollView(
          
          padding: const EdgeInsets.all(10.0),
          
          child: new Column(
            children: <Widget>[
              xixi(),
              xixi(),
              
            ],

          )
        ),
        

        bottomNavigationBar: new BottomAppBar(
          color: Colors.white,

          child: new Container(
            margin: const EdgeInsets.only(left: 50.0, right: 50.0),

            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,

              children: <Widget>[
                new IconButton(  
                  tooltip: 'Time',     
                  icon: new Icon(Icons.notifications_none),
                  iconSize: 30,
                  color: Colors.black,

                  onPressed: _logoutUser,
                ),

                new IconButton(
                  tooltip: 'Todo',
                  icon: new Icon(Icons.chat_bubble_outline),
                  iconSize: 30,
                  color: Colors.black,
                  
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return new Upload();
                    }));
                  },
                ),

                 new IconButton(
                   tooltip: 'Me',
                  icon: new Icon(Icons.menu),
                  iconSize: 30,
                  color: Colors.black,
                                                      
                  onPressed: _logoutUser,
                ),
              ],
            ),
          ),
        ),
      );
    }
}