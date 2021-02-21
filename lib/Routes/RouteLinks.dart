import 'package:flutter/material.dart';
import 'package:ispiti_jebote/Widgets/Cards/LinkCard.dart';

class RouteLinks extends StatefulWidget {
  _RouteLinksState createState() => _RouteLinksState();
}

class _RouteLinksState extends State<RouteLinks> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Links")),
      body:Column(
        children: [
          LinkCard(Icons.arrow_drop_down_outlined,
              "Hipatija",
              "finansije/grupe/molbe",
              "https://hypatia.matf.bg.ac.rs:10333/StudInfo/scripts/studenti/prijavljivanjeFormular",
              "ae"),
          LinkCard(Icons.arrow_drop_down_outlined,
              "Raspored kurseva",
              "a wild \"mini izmene\" approaches",
              "http://poincare.matf.bg.ac.rs/~kmiljan/raspored/sve/",
              "ae"),
          LinkCard(Icons.arrow_drop_down_outlined,
              "Matf homepage",
              "the original",
              "http://www.matf.bg.ac.rs/",
              "aeae"),
          LinkCard(Icons.arrow_drop_down_outlined,
              "Raspored ispita",
              "upucacu se",
              "http://www.matf.bg.ac.rs/m/36/raspored-ispita/",
              "ae"
          ),
          LinkCard(Icons.arrow_drop_down_outlined,
              "MATF Dropbox",
              "the real mvps",
              "https://www.dropbox.com/sh/k6rpc778w76ll2o/AACYhH5jiUVi2MADa5A3DQcfa",
              "ae"
          ),
        ],
      ),
    );
  }
}

