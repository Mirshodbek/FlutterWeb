import 'package:flutter/material.dart';

class PopUpMenuTile extends StatelessWidget {
  const PopUpMenuTile(
      {Key key,
      @required this.icon,
      @required this.title,
      this.isActive = false})
      : super(key: key);
  final IconData icon;
  final String title;
  final bool isActive;

  static final popUpMenu = [
    PopupMenuItem(
      child: PopUpMenuTile(icon: Icons.people_rounded, title: "New Group"),
    ),
    PopupMenuItem(
      child: PopUpMenuTile(icon: Icons.contact_phone_sharp, title: "Contacts"),
    ),
    PopupMenuItem(
      child: PopUpMenuTile(icon: Icons.settings, title: "Settings"),
    ),
    PopupMenuItem(
      child: PopUpMenuTile(icon: Icons.help_outline, title: "WebChat FAQ"),
    ),
    PopupMenuItem(
      child: PopUpMenuTile(icon: Icons.send_rounded, title: "About"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 550.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            color: isActive
                ? Theme.of(context).accentColor
                : Theme.of(context).primaryColor,
            size: 30.0,
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            title,
            style: TextStyle(
              color: isActive
                  ? Theme.of(context).accentColor
                  : Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
