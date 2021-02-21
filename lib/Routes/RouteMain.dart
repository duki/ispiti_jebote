import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ispiti_jebote/Routes/RouteCoursePicker.dart';
import 'package:ispiti_jebote/Routes/RouteLinks.dart';
import 'package:ispiti_jebote/Routes/RouteStudentCreate.dart';
import 'package:ispiti_jebote/Utilities/TrackerInitializer.dart';
import 'package:ispiti_jebote/Utilities/UserInfoStore.dart';
import 'package:ispiti_jebote/Routes/RouteCourseObserver.dart';
import 'package:ispiti_jebote/Routes/RouteNearbyTracker.dart';
import '../Types/Student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ispiti jebote',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ispiti jebote'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String namedText = "unknown";
  String namedUni = "unknown";

  Future<void> changeText() async {
    String myAlias, myUni;
    int myGodina;

    try {
      UserInfoStorage billy = new UserInfoStorage();
      Student myStudent = await billy.studentFF;
      myAlias = myStudent.getAlias();
      myGodina = myStudent.getGodina();
      myUni = myStudent.getUni();
    } catch (_) {
      print("no student file... yet");
    }

    setState(() {
      namedText = myAlias;
      student_name = myAlias;
      student_level = myGodina;
      namedUni = myUni;
    });
  }

  String student_name = "";
  int student_level = 1;
  File user_image;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      print("main initiated...");
      changeText();
      TrackerInitializer t1 = new TrackerInitializer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "\"Pishaj mi za sto,\npostalo je opasno\"",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "@$namedText",
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      ),
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.pink),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {
                        File _image;
                        final picker = ImagePicker();
                        Future.delayed(Duration.zero, () async {
                          final pickedFile = await picker.getImage(
                              source: ImageSource.gallery);

                          setState(() {
                            if (pickedFile != null) {
                              _image = File(pickedFile.path);
                              // TODO: Implement the ability to choose an image
                            } else {
                              print('No image selected.');
                            }
                          });
                        });
                      },
                      child: CircleAvatar(
                          radius: 40,
                          backgroundImage: new NetworkImage(
                              "https://avatars.githubusercontent.com/u/62844863?s=400&u=1c5a51614d6e34d787a56081b376cc3f4eeab6d3&v=4"))),
                ),
                Align(
                  child: Text("$student_name",
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                  alignment: Alignment.centerLeft + Alignment(0, .65),
                ),
                Align(
                  child: Text("level $student_level student",
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  alignment: Alignment.centerLeft + Alignment(0, 1),
                ),
                Align(
                  child: Text("[$namedUni]",
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                  alignment: Alignment.centerLeft + Alignment(0, -.45 * 2.35),
                ),
              ],
            ),
          ),
          ListTile(
              title: Text(
                "Change your info",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text("Alias/Level/Uni"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RouteStudentCreate()),
                );
              }),
          ListTile(
              title: Text(
                "Register courses",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text("Choose your fails"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RouteCoursePicker()),
                );
              }),
          ListTile(
              title: Text(
                "Observer",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text("Get notified when a course page changes"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RouteCourseObserver()),
                );
              }),
          ListTile(
              title: Text(
                "Who's here",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text("See who's nearby"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RouteNearbyTracker()),
                );
              }),
          ListTile(
              title: Text(
                "Links",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text("laziness 100"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RouteLinks()),
                );
              }),
        ],
      )),
    );
  }
}
