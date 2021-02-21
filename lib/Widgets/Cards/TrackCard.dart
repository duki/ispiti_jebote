import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ispiti_jebote/Types/Course.dart';
import 'package:ispiti_jebote/Utilities/CourseInfoStore.dart';
import 'package:ispiti_jebote/Routes/RouteCourseObserver.dart';

class TrackCard extends StatefulWidget {
  final RouteCourseObserverState parentstate;

  IconData trackIcon = Icons.track_changes;
  final String _name;
  int resp_length;
  String _status = "no addr :/";
  String _lastChange = "last change: never";
  String _buttonText = "Untrack";
  final Course _course;

  TrackCard({Course course, RouteCourseObserverState parentman})
      : _name = course.courseName,
        _status = course.courseAddr != null ? course.courseAddr : "no addr :/",
        _course = course,
        resp_length = course.respLength,
        _lastChange = course.changeTime != null ? "last change: " + (((DateTime.now().millisecondsSinceEpoch - course.changeTime) / 60000).round().toString() + " min ago" ): "never",
        parentstate = parentman;

  @override
  _TrackCardState createState() => _TrackCardState();
}

class _TrackCardState extends State<TrackCard> {
  void removeCourse() async {
    CourseInfoStore c1 = new CourseInfoStore();
    await c1.untrackCourse(widget._course);
    widget.parentstate.setState(() {
      for(int i = 0; i < widget.parentstate.gcList.length; i++){
        if(widget.parentstate.gcList[i] == widget._course){
          widget.parentstate.gcList.remove(widget._course);
        }
      }
    });
    setState(() {
      widget._status = "stopped tracking...";
      widget._lastChange = "removed";
      widget._buttonText = "(gone)";
      widget.trackIcon = Icons.remove;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Icon(widget.trackIcon),
            title: Text(widget._name),
            subtitle: Text(
              widget._status,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget._lastChange,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                textColor: const Color(0xFF6200EE),
                onPressed: () {
                  removeCourse();

                  // Perform some action
                },
                child: Text(widget._buttonText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
