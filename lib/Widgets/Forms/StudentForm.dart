import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ispiti_jebote/Routes/RouteMain.dart';
import 'package:ispiti_jebote/Utilities/ExampleServer.dart';
import 'package:ispiti_jebote/Utilities/UserInfoStore.dart';
import 'package:flutter/widgets.dart';

import '../../Types/Student.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final myControllerAlias = TextEditingController();
  final myControllerYear = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  MyServer andrew;
  UserInfoStorage billy;
  String dropdownValue;

  @override
  void initState() {
    super.initState();
    andrew = new MyServer();
    billy = new UserInfoStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            style: TextStyle(
              color: Colors.pink,
            ),
            controller: myControllerAlias,
            decoration: InputDecoration(
                fillColor: Colors.pink,
                focusColor: Colors.pink,
                labelText: "Alias",
                hintText: "Upisi zeljeni nick"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            style: TextStyle(
              color: Colors.pink,
            ),
            controller: myControllerYear,
            decoration: InputDecoration(
                labelText: "Faks Level", hintText: "Trenutna godina faksa"),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.school),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['MATF']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Container(
            padding: EdgeInsets.all(50),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                  Random rand = new Random();
                  int newId = rand.nextInt(10000);
                  Student tmpStudent = new Student(
                      id: newId,
                      godina: int.parse(myControllerYear.text),
                      alias: myControllerAlias.text,
                      uni: dropdownValue);
                  print(tmpStudent);
                  billy.setUser(tmpStudent);
                }
              },
              child: Text("ae napravi"),
            ),
          ),
        ]));
  }
}
