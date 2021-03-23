import 'package:flutter/material.dart';

@immutable
class ExpansionTiles extends StatelessWidget {
  final String title;

  ExpansionTiles(this.title);

  static final expansionTiles = [
    PopupMenuItem(
      child: ExpansionTiles("New Group"),
    ),
    PopupMenuItem(
      child: ExpansionTiles("Contacts"),
    ),
    PopupMenuItem(
      child: ExpansionTiles("Settings"),
    ),
    PopupMenuItem(
      child: ExpansionTiles("WebChat FAQ"),
    ),
    PopupMenuItem(
      child: ExpansionTiles("About"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
    );
  }
}
