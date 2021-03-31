import 'package:flutter/material.dart';

@immutable
class PopUpMenuRight extends StatelessWidget {
  final String title;

  PopUpMenuRight(this.title);

  static final expansionTiles = [
    PopupMenuItem(
      child: PopUpMenuRight("New Group"),
    ),
    PopupMenuItem(
      child: PopUpMenuRight("Contacts"),
    ),
    PopupMenuItem(
      child: PopUpMenuRight("Settings"),
    ),
    PopupMenuItem(
      child: PopUpMenuRight("WebChat FAQ"),
    ),
    PopupMenuItem(
      child: PopUpMenuRight("About"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
