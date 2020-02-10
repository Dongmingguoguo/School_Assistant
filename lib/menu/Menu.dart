import 'package:flutter/material.dart';

class Menu extends StatefulWidget{
  @override
  State<Menu> createState() {
    // TODO: implement createState
    return _Menu();
  }
}

class _Menu extends State<Menu> {
  @override
  Widget build(BuildContext context) {
  
      return new Scaffold(
      appBar: new AppBar(
        title: new Text('Menu'),
        centerTitle: true,
      ),
      body: new Center(
        
      ),
      
      
    );
      
  }
}