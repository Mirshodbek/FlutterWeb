import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/screens/screens.dart';
import 'package:web_chat/widgets/widgets.dart';

class Contacts extends ConsumerWidget {
  void _cancelDelete(BuildContext context) {
    context.read(helperPRPro).editContact(Edit.noEdit);
    context.read(listContactsPro).cancelDelete();
  }

  @override
  Widget build(BuildContext context, watch) {
    final contactListVM = watch(listContactsPro.state).toList();
    final contactsVM = watch(listContactsPro);
    final profile = watch(helperPRPro.state);

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
                if (profile.edit == Edit.noEdit)
                  Row(
                    children: [
                      TextButton(
                        onPressed: () =>
                            context.read(helperPRPro).editContact(Edit.edit),
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
                  ),
                if (profile.edit == Edit.edit)
                  TextButton(
                    onPressed: () => _cancelDelete(context),
                    child: Text(
                      "Cancel",
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
                  onPressed: () {
                    if (profile.edit == Edit.edit)
                      context.read(listContactsPro).selectContact(i);
                    else
                      return;
                  },
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
        if (profile.edit == Edit.noEdit)
          MaterialButton(
            minWidth: Responsive.width(context) * 0.3,
            onPressed: () => showDialog(
              context: context,
              builder: (builder) {
                return NewContact();
              },
            ),
            child: Text(
              "NEW CONTACT",
              style: buttonStyle,
            ),
          ),
        if (profile.edit == Edit.edit)
          contactsVM.onPressed()
              ? TextButton(
                  onPressed: () => context.read(listContactsPro).delete(),
                  child: Text(
                    "Delete ${contactsVM.lengthDeletedContacts}",
                    style: buttonStyle.copyWith(
                      color: Colors.red,
                    ),
                  ),
                )
              : SelectableText(
                  "Delete 0",
                  style: buttonStyle.copyWith(
                    color: Colors.red,
                  ),
                ),
      ],
      actionsPadding: EdgeInsets.only(bottom: 15.0),
    );
  }
}
