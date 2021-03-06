import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/desktop/desktop.dart';

class HeaderProfile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final profiles = watch(listProfilePro.state).toList();
    final index = watch(helperPRPro.state);
    final profileName = profiles[index.index];
    return Container(
      color: Color(0xFF497799),
      child: Row(
        children: [
          SizedBox(
            width: 350.0,
            child: PopupMenuButton(
              onSelected: (value) {
                showDialog(
                  context: context,
                  builder: (dialog) {
                    if (value == 1)
                      return Contacts();
                    else if (value == 0)
                      return NewGroup();
                    else if (value == 4)
                      return About();
                    else
                      return SizedBox.shrink();
                  },
                );
              },
              offset: Offset(0.0, 50.0),
              color: Colors.white,
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "Web Chat",
                    style: headerTextStyle,
                  ),
                ],
              ),
              itemBuilder: (context) => popUpMenu,
            ),
          ),
          Expanded(
            child: Text(
              profileName.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          PopupMenuButton(
            offset: Offset(5.0, 45.0),
            color: Colors.white,
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 35.0,
            ),
            itemBuilder: (context) => PopUpMenuRight.expansionTiles,
          ),
        ],
      ),
    );
  }
}
