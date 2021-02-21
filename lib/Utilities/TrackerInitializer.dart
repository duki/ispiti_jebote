import 'dart:convert';
import 'dart:io';
import 'package:ispiti_jebote/Types/Course.dart';
import 'package:path_provider/path_provider.dart';
import 'DBWorkerCourse.dart';

class TrackerInitializer {

  TrackerInitializer() {
    Future.delayed(Duration.zero, () async {
      checkAndInitialize();
    });
  }

  Future<List<Course>> get getList async {
    final path = await _localPath;
    String filePath = "$path/kursevi.json";
    bool fileExists =
        FileSystemEntity.typeSync(filePath) != FileSystemEntityType.notFound;

    final File openFile = File(filePath);
    if (fileExists) {
      List<Course> trackedCourses = new List<Course>();

      String rawFileContents = await openFile.readAsString();
      List<dynamic> myList = jsonDecode(rawFileContents);

      for (var value in myList) {
        if (value['tracked'] == true) {
          trackedCourses.add(new Course.fromJson(value));
        }
      }
      return trackedCourses;
    } else {
      return null;
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<void> checkAndInitialize() async {
    final path = await _localPath;
    print(path);
    String filePath = "$path/kursevi.json";
    bool fileExists =
        FileSystemEntity.typeSync(filePath) != FileSystemEntityType.notFound;

    final File openFile = File(filePath);

    if (fileExists) {
      print("File already exists, cool, huh?");
      String rawFileContents = await openFile.readAsString();
      List<String> tokens = rawFileContents.split(",");
    } else {
      print("File doesn't exist...creating one now");
      DbWorkerCourses billy = new DbWorkerCourses();
      List<Course> tmpcourses = await billy.getCourses();
      String outstr = jsonEncode(tmpcourses);
      print(outstr);
      openFile.writeAsString(outstr);
    }
  }
}
