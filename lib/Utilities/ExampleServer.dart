import 'dart:io';
import 'dart:convert';

import 'package:ispiti_jebote/Types/Student.dart';

class MyServer {
  // TODO: everything from scratch again
  void sendBroadcast(Student me) async {
    for (int i = 0; i < 100; i++) {
      await Future.delayed(Duration(milliseconds: 2500), () {
        var DEST_ADDR = InternetAddress("192.168.1.255");
        RawDatagramSocket.bind(InternetAddress.anyIPv4, 5601)
            .then((RawDatagramSocket udpSocket) {
          udpSocket.broadcastEnabled = true;
          List<int> data = utf8.encode(me.toString());
          udpSocket.send(data, DEST_ADDR, 5601);
          print("Sent data!");
        });
      });
    }
  }
}
