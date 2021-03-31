import 'package:flutter/material.dart';
import 'package:web_chat/widgets/widgets.dart';

class HeaderAuth extends StatelessWidget {
  final Function nextPage;

  HeaderAuth(this.nextPage);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF5682A3),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Icon(
                  Icons.send_outlined,
                  size: 25.0,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  "D-chat",
                  style: headerTextStyle,
                ),
              ],
            ),
          ),
          Spacer(
            flex: 4,
          ),
          Expanded(
            flex: 2,
            child: TextButton(
              onPressed: nextPage,
              child: Row(
                children: [
                  Text(
                    "Next",
                    style: headerTextStyle,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
