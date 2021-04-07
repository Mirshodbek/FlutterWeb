import 'package:flutter/material.dart';
import 'package:web_chat/widgets/widgets.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      title: Container(
        color: Color(0xFF5682A3),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectableText(
                  "About",
                  style: headerTextStyle,
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    "Close",
                    style: headerTextStyle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF437197),
                    radius: 45.0,
                    child: Icon(
                      Icons.send,
                      size: 30.0,
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Column(
                    children: [
                      SelectableText(
                        "WebChat",
                        style: headerTextStyle,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      SelectableText(
                        "Version 0.0.0",
                        style: headerTextStyle.copyWith(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      content: Container(
        width: Responsive.width(context) * 0.3,
        padding: EdgeInsets.only(left: 100.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.0,
            ),
            SelectableText(
              "Official free messaging app based on Telegram API for speed and security.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            SelectableText(
              "This software is licensed under GNU GPL version 3.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Changelog",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "GitHub",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black38,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
