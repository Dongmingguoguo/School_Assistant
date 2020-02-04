import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Upload extends StatefulWidget{
  State<StatefulWidget> createState() {
    return _Upload();
  }
}

class _Upload extends State<Upload> {
  File sampleImage;
  final formKey = new GlobalKey<FormState>();
  String _myValue;


  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    print('here!');


    setState((){
      sampleImage = tempImage;
    });
  }

  bool validateAndSave() {
    final form = formKey.currentState;

    if(form.validate()){
      form.save();
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Upload Image2'),
        centerTitle: true,
      ),

      body: new Center(
        child: sampleImage == null ? Text('Select an Image') : enableUpload(),
      ),

      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add Image',
        child: new Icon(Icons.add_a_photo),
        onPressed: getImage,
      ),
    );
  }

  Widget enableUpload(){
    return Container(
      child: new Form(
        key: formKey,
          child: Column(
            children: <Widget>[
              Image.file(sampleImage, height: 330.0, width:660.0,),
              SizedBox(height: 15.0,),
              TextFormField(
                decoration: new InputDecoration(labelText: 'Description'),
                validator: (value){
                  return value.isEmpty ? 'Blod Description is required' : null;
                },
                onSaved: (value) {
                  return _myValue = value;
                },
              ),

              SizedBox(height: 15.0,),
              RaisedButton(
                elevation: 10.0,
                child: Text('Add a new post'),
                textColor: Colors.white,
                color: Colors.pink,

                onPressed: validateAndSave,
                )
            ],
          ),   
      ),
    );
  }
}