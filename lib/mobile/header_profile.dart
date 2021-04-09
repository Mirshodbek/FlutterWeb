import 'package:flutter/material.dart';

import 'mobile.dart';

class HeaderProfileMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF497799),
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.send,
                color: Colors.white,
                size: 35.0,
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                "WebChat",
                style: headerTextStyle,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.white,
                size: 35.0,
              ),
              SizedBox(
                width: 15.0,
              ),
              Icon(
                Icons.menu,
                color: Colors.white,
                size: 35.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
