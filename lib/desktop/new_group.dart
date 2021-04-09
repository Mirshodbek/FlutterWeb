import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/desktop/desktop.dart';

class NewGroup extends ConsumerWidget {
  void _cancel(BuildContext context) {
    context.read(listContactsPro).cancelDelete();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, watch) {
    final contactListVM = watch(listContactsPro.state).toList();
    final contactsVM = watch(listContactsPro);
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
                contactsVM.onPressed()
                    ? SelectableText(
                        "${contactsVM.lengthDeletedContacts} members",
                        style: headerTextStyle,
                      )
                    : SelectableText(
                        "New Group",
                        style: headerTextStyle,
                      ),
                TextButton(
                  onPressed: () => _cancel(context),
                  child: Text(
                    "Close",
                    style: headerTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            color: Colors.white,
            child: TextField(
              onChanged: context.read(listContactsPro).search,
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
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          width: Responsive.width(context) * 0.3,
          child: Column(
            children: [
              for (int i = 0; i < contactListVM.length; i++)
                TextButton(
                  key: ObjectKey(contactListVM[i]),
                  onPressed: () =>
                      context.read(listContactsPro).selectContact(i),
                  style: TextButton.styleFrom(
                    backgroundColor: contactListVM[i].isSelected
                        ? Colors.blue
                        : Colors.white,
                  ),
                  child: ProfileUser(
                    profiles: contactListVM[i],
                    textWidget: Text(
                      "last seen recently",
                      style: TextStyle(color: Colors.black26),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => _cancel(context),
          child: Text(
            "Cancel",
            style: buttonStyle,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Next",
            style: buttonStyle,
          ),
        ),
      ],
    );
  }
}
