import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/screens/screens.dart';
import 'package:web_chat/widgets/widgets.dart';

class Contacts extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final profiles = watch(listContactsPro.state).toList();
    final profileList = watch(listContactsPro.state);
    final profileSelect = watch(profilePro);
    final profile = watch(profilePro.state);

    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      title: Column(
        children: [
          Container(
            color: Color(0xFF5682A3),
            height: 60.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectableText(
                  "Contacts",
                  style: headerTextStyle,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Edit",
                        style: headerTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Close",
                        style: headerTextStyle,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            color: Colors.white,
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 10.0),
                  child: Icon(
                    Icons.search,
                    size: 28.0,
                    color: Colors.black26,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26),
                ),
                hintText: "Search",
              ),
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < profiles.length; i++)
              TextButton(
                key: ObjectKey(profiles[i]),
                onPressed: () {
                  // final select =
                  context.read(listContactsPro).selectContact(index: i);
                  // context.read(profilePro).isSelected(select);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: SizedBox(
                  width: Responsive.width(context) * 0.3,
                  child: ProfileUser(
                    profiles: profiles[i],
                    textWidget: Text(
                      "last seen recently",
                      style: TextStyle(color: Colors.black26),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      actions: [
        MaterialButton(
          minWidth: Responsive.width(context) * 0.3,
          onPressed: () {
            context.read(listContactsPro).delete();
            // showDialog(
            //   context: context,
            //   builder: (builder) {
            //     return NewContact();
            //   },
            // );
          },
          child: Text(
            "NEW CONTACT",
            style: buttonStyle,
          ),
        ),
      ],
      actionsPadding: EdgeInsets.only(bottom: 15.0),
    );
  }
}
