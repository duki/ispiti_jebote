import 'dart:convert';
import 'dart:io';

import 'package:ispiti_jebote/Types/Course.dart';
import 'package:path_provider/path_provider.dart';

class CourseInfoStore {
  CourseInfoStore();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print(path);
    return File('$path/kursevi.json');
  }

  Future<void> trackCourse(Course course) async {
    final file = await _localFile;
    final String fileContents = await file.readAsString();
    List<dynamic> courses = jsonDecode(fileContents);
    for (int i = 0; i < courses.length; i++) {
      Course tmpcourse = Course.fromJson(courses[i]);
      if (tmpcourse == course) {
        courses[i]['tracked'] = true;
        break;
      }
    }

    print("now following > " + course.courseName);
    final String newFileContents = jsonEncode(courses);
    await file.writeAsString(newFileContents);
  }

  Future<void> untrackCourse(Course course) async {
    final file = await _localFile;
    final String fileContents = await file.readAsString();
    List<dynamic> courses = jsonDecode(fileContents);
    for (int i = 0; i < courses.length; i++) {
      Course tmpcourse = Course.fromJson(courses[i]);
      if (tmpcourse == course) {
        courses[i]['tracked'] = false;
        break;
      }
    }

    print("stopping > " + course.courseName);
    final String newFileContents = jsonEncode(courses);
    await file.writeAsString(newFileContents);
  }

  Future<void> changeResponseLength(Course course, int newlen) async {
    final file = await _localFile;
    final String fileContents = await file.readAsString();
    List<dynamic> courses = jsonDecode(fileContents);
    for (int i = 0; i < courses.length; i++) {
      Course tmpcourse = Course.fromJson(courses[i]);
      if (tmpcourse == course) {
        if (tmpcourse.respLength == newlen) {
          return;
        } else {
          courses[i]['response_length'] = newlen;
          courses[i]['change_time'] = new DateTime.now().millisecondsSinceEpoch;
          print("changed length!!!");
        }
      }
    }
    final String newFileContents = jsonEncode(courses);
    await file.writeAsString(newFileContents);
  }
}
