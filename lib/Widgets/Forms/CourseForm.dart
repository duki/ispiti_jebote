import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ispiti_jebote/Routes/RouteMain.dart';
import 'package:ispiti_jebote/Types/Course.dart';
import 'package:ispiti_jebote/Utilities/CourseInfoStore.dart';
import 'package:ispiti_jebote/Utilities/ExampleServer.dart';
import 'package:ispiti_jebote/Utilities/UserInfoStore.dart';
import 'package:flutter/widgets.dart';

import '../../Types/Student.dart';

class CourseCreateForm extends StatefulWidget {
  @override
  _CourseCreateFormState createState() {
    return _CourseCreateFormState();
  }
}

class _CourseCreateFormState extends State<CourseCreateForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  final cSemestar = TextEditingController();
  final cESPB = TextEditingController();
  final cOpis = TextEditingController();
  final cNaziv = TextEditingController();
  final cAddr = TextEditingController();
  final cVlasnik = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            controller: cSemestar,
            decoration: InputDecoration(
              labelText: "Semestar",
              hintText: "ili samo lupi neki broj mn nije briga stv.",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: cESPB,
            decoration: InputDecoration(
              labelText: "ESPB",
              hintText: "vrednost poena koje kurs nosi",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: cOpis,
            decoration: InputDecoration(
              labelText: "Opis",
              hintText: "opis kursa",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: cNaziv,
            decoration: InputDecoration(
              labelText: "Naziv",
              hintText: "naziv kursa",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: cAddr,
            decoration: InputDecoration(
              labelText: "Web Stranica",
              hintText: "web adresa kursa",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: cVlasnik,
            decoration: InputDecoration(
              labelText: "Profesor/Asistent",
              hintText: "vlasnik stranice",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Container(
            padding: EdgeInsets.all(50),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
              ),
              onPressed: () {
                print(cAddr.text.substring(0, 4));
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Adding course...')));
                  Course tmpCourse = new Course(
                      int.parse(cSemestar.text),
                      null,
                      int.parse(cESPB.text),
                      cOpis.text,
                      cNaziv.text,
                      cAddr.text.substring(0, 4) == "http" ? cAddr.text : "https://${cAddr.text}",
                      cVlasnik.text,
                      true,
                      DateTime.now().millisecondsSinceEpoch
                  );
                  final billy = new CourseInfoStore();
                  billy.addCourse(tmpCourse);
                }
              },
              child: Text("ae napravi"),
            ),
          ),
        ]));
  }
}
