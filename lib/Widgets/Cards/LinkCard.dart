import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkCard extends StatelessWidget {
  final IconData _icon;
  final String _title;
  final String _desc;
  final String _url;
  final String _buttonText;

  const LinkCard(this._icon, this._title, this._desc, this._url, this._buttonText);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Icon(_icon),
            title: Text(_title),
            subtitle: Text(_desc ,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              launch(_url);
            },
            child: Text(_buttonText),
          ),
        ],
      ),
    );
  }
}
