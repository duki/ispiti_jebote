import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ispiti_jebote/Types/Course.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertChangeDialog {
  createAlertDialog(BuildContext context, Course course) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("na stranici ${course.courseName.toLowerCase()} mozda ima nes novo"),
            actions: [
              MaterialButton(
                onPressed: () {
                  launch(course.courseAddr);
                  Navigator.pop(context);
                },
                child: Text("ae moze"),
              ),
              MaterialButton(onPressed: () {Navigator.pop(context);}, child: Text("umri"))
            ],
          );
        });
  }
}
