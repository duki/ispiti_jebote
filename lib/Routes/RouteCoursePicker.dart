import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ispiti_jebote/Widgets/Cards/CourseCard.dart';
import 'package:ispiti_jebote/Utilities/DBWorkerCourse.dart';

import '../Types/Course.dart';

class RouteCoursePicker extends StatefulWidget {
  @override
  _RouteCoursePickerState createState() => _RouteCoursePickerState();
}

class _RouteCoursePickerState extends State<RouteCoursePicker> {
  List<Course> _courses;
  DbWorkerCourses dbWork = new DbWorkerCourses();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      List<Course> tmpcourses = await dbWork.getCourses();

      setState(() {
        _courses = tmpcourses;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kursevi"),
      ),
      body: Center(
          child: Container(
        child: new ListView.builder(
          cacheExtent: 3000,
          itemCount: _courses == null ? 0 : _courses.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return CourseCard(cardCourse: _courses[index]);
          },
        ),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      )),
    );
  }
}
