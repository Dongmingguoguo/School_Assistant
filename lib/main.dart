import 'package:final_project/Home/Authentication.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Home/HomePage.dart';
import 'package:final_project/Register/LoginRegisterPage.dart';
import 'package:final_project/Home/Mapping.dart';
import 'package:final_project/Home/Authentication.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MappingPage(auth: Auth(),),
    );
  }
}

