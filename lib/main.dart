import 'package:final_project/Home/Authentication.dart';
import 'package:final_project/Home/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Home/HomePage.dart';
import 'package:final_project/Register/LoginRegisterPage.dart';
import 'package:final_project/Home/Mapping.dart';
import 'package:final_project/Home/Authentication.dart';
import 'package:final_project/Help_Center/help.dart';


void main() => runApp(BlogApp());

class BlogApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

       home: MappingPage(auth: Auth(),),

       theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     
    );
  }
}

