import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ispiti_jebote/Types/Course.dart';
import 'package:ispiti_jebote/Utilities/CourseInfoStore.dart';

class CourseCard extends StatelessWidget {
  final String _name;
  final String _desc;
  final int _points;
  final Course _course;
  final File trackFile = new File("kursevi.txt");

  CourseCard({Course cardCourse})
      : _name = cardCourse.courseName,
        _desc = cardCourse.courseDesc,
        _points = cardCourse.coursePoints,
        _course = cardCourse;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: Text('$_name'),
            subtitle: Text(
              '$_points ESPB',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '$_desc',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                textColor: const Color(0xFF6200EE),
                onPressed: () {
                  CourseInfoStore c1 = new CourseInfoStore();
                  c1.trackCourse(_course);
                  // Perform some action
                },
                child: const Text('Track course'),
              ),
              FlatButton(
                textColor: const Color(0xFF6200EE),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('More info'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
