import 'dart:convert';
import 'dart:io';
import 'package:ispiti_jebote/Types/Student.dart';
import 'package:path_provider/path_provider.dart';


class UserInfoStorage {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print(path);
    return File('$path/studentInfo.txt');
  }

  Future<void> setUser(Student student) async {
    final file = await _localFile;
    List<Student> students = new List<Student>();
    students.add(student);
    String outstring = jsonEncode(students);
    file.writeAsString(outstring);
  }

  Future<Student> get studentFF async {
    final file = await _localFile;
    String contents = await file.readAsString();
    try {
      List<dynamic> students = jsonDecode(contents);
      return new Student(id:students[0]['id'], uni:students[0]['uni'], alias:students[0]['nick'], godina:students[0]['godina']);

    } catch (e) {
      print(e);
      print("json parse error");
      return null;
    }
  }
}
