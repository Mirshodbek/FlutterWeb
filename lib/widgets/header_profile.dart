import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/widgets/widgets.dart';

class HeaderProfile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    // final profiles = watch(listContactsPro.state).toList();
    // final index = watch(profilePro.state);
    // final profileName = profiles[index.index];
    return Container(
      color: Color(0xFF497799),
      child: Row(
        children: [
          SizedBox(
            width: 350.0,
            child: PopupMenuButton(
              onSelected: (value) {
                if (value == 1) {
                  showDialog(
                    context: context,
                    builder: (dialog) {
                      return Contacts();
                    },
                  );
                }
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
              " profileName.name",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 15.0,
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
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }
}
