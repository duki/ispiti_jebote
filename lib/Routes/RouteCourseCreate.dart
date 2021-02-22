import 'package:flutter/material.dart';
import 'package:ispiti_jebote/Widgets/Forms/CourseForm.dart';
import 'package:ispiti_jebote/Widgets/Forms/StudentForm.dart';

class RouteCourseCreate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Course creation';
    return Scaffold(

      appBar: AppBar(
        title: Text(appTitle),
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.all(20),
          child:CourseCreateForm()
      ),
    );
  }
}