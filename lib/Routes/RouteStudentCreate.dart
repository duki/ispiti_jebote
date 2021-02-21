import 'package:flutter/material.dart';
import 'package:ispiti_jebote/Widgets/Forms/StudentForm.dart';

class RouteStudentCreate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Student creation';
    return Scaffold(

        appBar: AppBar(
          title: Text(appTitle),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(20),
                child:MyCustomForm()
        ),
      );
  }
}