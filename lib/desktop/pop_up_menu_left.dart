import 'package:flutter/material.dart';

class PopUpMenuTileLeft extends StatelessWidget {
  const PopUpMenuTileLeft(
      {Key key,
      @required this.icon,
      @required this.title,
      this.isActive = false})
      : super(key: key);
  final IconData icon;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            icon,
            color: isActive ? Theme.of(context).accentColor : Colors.blue,
            size: 30.0,
          ),
          SizedBox(
            width: 25.0,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

final popUpMenu = [
  PopupMenuItem(
    value: 0,
    child: PopUpMenuTileLeft(
      icon: Icons.people_rounded,
      title: "New Group",
    ),
  ),
  PopupMenuItem(
    value: 1,
    child: PopUpMenuTileLeft(
      icon: Icons.contact_phone_sharp,
      title: "Contacts",
    ),
  ),
  PopupMenuItem(
    value: 2,
    child: PopUpMenuTileLeft(
      icon: Icons.settings,
      title: "Settings",
    ),
  ),
  PopupMenuItem(
    value: 3,
    child: PopUpMenuTileLeft(
      icon: Icons.help_outline,
      title: "WebChat FAQ",
    ),
  ),
  PopupMenuItem(
    value: 4,
    child: PopUpMenuTileLeft(
      icon: Icons.send_rounded,
      title: "About",
    ),
  ),
];
