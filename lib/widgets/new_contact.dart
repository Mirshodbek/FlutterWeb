import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/widgets/widgets.dart';

class NewContact extends ConsumerWidget {
  final _name = TextEditingController();
  InputDecoration _decoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        fontSize: 20.0,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
    );
  }

  void save(BuildContext context) {
    final name = _name.text;
    if (name.isNotEmpty) {
      context.read(listContactsPro).add(name: name);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context, watch) {
    return AlertDialog(
      titlePadding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 50.0),
      title: SelectableText(
        "Add new contact",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
      ),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        width: 450.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20.0,
            ),
            TextField(
              decoration: _decoration("Phone Number"),
            ),
            SizedBox(
              height: 40.0,
            ),
            TextField(
              controller: _name,
              decoration: _decoration("First Name"),
            ),
            SizedBox(
              height: 40.0,
            ),
            TextField(
              decoration: _decoration("Last Name"),
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
      actionsPadding: EdgeInsets.all(25.0),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            "Cancel",
            style: buttonStyle,
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        TextButton(
          onPressed: () => save(context),
          child: Text(
            "Save",
            style: buttonStyle,
          ),
        ),
      ],
    );
  }
}
