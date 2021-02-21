import 'dart:io';

import 'package:flutter/services.dart';
import 'package:ispiti_jebote/Types/Course.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbWorkerCourses {

  Future<Database> connectToDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "matfkursevi.db");

    final exists = await databaseExists(path);

    if (exists) {
      Future<Database> db1 = openDatabase(path);
      return db1;
    } else {
      print("it doesn't focken exist\ncreating a copy from assets");
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {
        print("u gae");
      }

      ByteData data = await rootBundle.load(join("assets", "matfkursevi.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
      print("db copied");

      return openDatabase(path);
    }
  }

  Future<List<Course>> getCourses() async {
    final Database db = await connectToDB();
    final List<Map<String, dynamic>> maps = await db.query("MatfCourses");

    return List.generate(maps.length, (index) {
      return Course(
          maps[index]['Semestar'],
          null,
          maps[index]['ESPB'],
          maps[index]['Desc'],
          maps[index]['Name'],
          maps[index]['WebAddr'],
          maps[index]['Owner'],
          false,
          -1);
    });
  }
}
