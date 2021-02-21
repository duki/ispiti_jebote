import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ispiti_jebote/Types/Course.dart';
import 'package:ispiti_jebote/Utilities/Checker.dart';
import 'package:ispiti_jebote/Utilities/TrackerInitializer.dart';
import 'package:ispiti_jebote/Widgets/Cards/TrackCard.dart';

class RouteCourseObserver extends StatefulWidget {
  @override
  RouteCourseObserverState createState() => RouteCourseObserverState();
}

class RouteCourseObserverState extends State<RouteCourseObserver> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      TrackerInitializer l1 = new TrackerInitializer();
      List<Course> xlist = await l1.getList;
      setState(() {
        gcList = xlist;
      });
      Checker c1 = new Checker(context);
      await c1.editSelected(gcList);
      Future.delayed(Duration.zero, () async {
        TrackerInitializer tracker = new TrackerInitializer();
        List<Course> lclist = await tracker.getList;
        setState(() {
          gcList = lclist;
        });
      });
    });
  }

  List<Course> gcList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Observer"),
      ),
      body: Column(
        children: [
          Expanded(
          child: ListView.builder(
            cacheExtent: 3000,
            scrollDirection: Axis.vertical,
            itemCount: gcList == null ? 0 : gcList.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return TrackCard(course: gcList[index], parentman: this);
            },
          ),
          ),
        ],
      )
    );
  }
}
