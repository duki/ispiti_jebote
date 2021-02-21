class Student {
  final int _id;
  final String _alias;
  final int _godina;
  final String _uni;

  String getAlias() {
    return this._alias;
  }

  String getUni() {
    return this._uni;
  }

  int getGodina() {
    return this._godina;
  }

  int getId() {
    return this._id;
  }

  Student({int id, int godina, String alias, String uni})
      : _alias = alias,
        _godina = godina,
        _id = id,
        _uni = uni;

  factory Student.fromJson(dynamic data) {
    return Student(
        id: data['id'] as int,
      godina: data['godina'] as int,
      alias: data['nick'] as String,
      uni: data['uni'] as String
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': getId(),
      'godina': getGodina(),
      'nick': getAlias(),
      'uni' : getUni()
    };
  }

  Map<String, dynamic> toJson() => toMap();

  @override
  String toString() {
    return "$getId() $getUni() $getAlias() $getGodina()";
  }
}
