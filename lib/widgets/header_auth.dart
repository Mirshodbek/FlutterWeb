import 'package:flutter/material.dart';
import 'package:web_chat/widgets/widgets.dart';

class HeaderAuth extends StatelessWidget {
  final Function nextPage;
  final double width;

  HeaderAuth(this.nextPage, this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF5682A3),
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                "WebChat",
                style: headerTextStyle,
              ),
            ],
          ),
          TextButton(
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
        ],
      ),
    );
  }
}
