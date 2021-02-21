class Course {
  int _semBegin;
  int _semResponseLength;
  int _semCoursePoints;
  String _semCourseDesc;
  String _semCourseName;
  String _semCourseAddr;
  String _semCourseOwner;
  bool _semTracked;
  int _semChangeTime;

  int get semesterBegin => _semBegin;
  int get respLength => _semResponseLength;
  int get coursePoints => _semCoursePoints;
  String get courseDesc => _semCourseDesc;
  String get courseName => _semCourseName;
  String get courseAddr => _semCourseAddr;
  String get courseOwner => _semCourseOwner;
  bool get tracked => _semTracked;
  int get changeTime => _semChangeTime;

  Course(
      this._semBegin,
      this._semResponseLength,
      this._semCoursePoints,
      this._semCourseDesc,
      this._semCourseName,
      this._semCourseAddr,
      this._semCourseOwner,
      this._semTracked,
      this._semChangeTime);

  factory Course.fromJson(dynamic data) {
    return Course(
        data['semester_begin'] as int,
        data['response_length'] as int,
        data['course_points'] as int,
        data['course_desc'] as String,
        data['course_name'] as String,
        data['course_addr'] as String,
        data['course_owner'] as String,
        data['tracked'] as bool,
        data['change_time'] as int);
  }

  Map<String, dynamic> toMap() {
    return {
      'semester_begin': semesterBegin,
      'course_name': courseName,
      'course_points': coursePoints,
      'course_desc': courseDesc,
      'course_addr': courseAddr,
      'course_owner': courseOwner,
      'tracked': tracked,
      'response_length': respLength,
      'change_time': changeTime
    };
  }

  Map<String, dynamic> toJson() => toMap();

  @override
  String toString() {
    return 'Course($semesterBegin | $courseName | $tracked | $respLength)';
  }

  @override
  bool operator ==(Object other) {
    Course tmp = other;
    return courseAddr == tmp.courseAddr &&
        courseName == tmp.courseName &&
        courseDesc == tmp.courseDesc &&
        courseOwner == tmp.courseOwner &&
        coursePoints == tmp.coursePoints;
  }
}
