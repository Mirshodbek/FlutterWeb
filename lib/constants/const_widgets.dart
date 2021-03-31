import 'package:flutter/material.dart';

const headerTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 22.0,
);
const buttonStyle = TextStyle(
  color: Colors.blue,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
TextStyle textStyleIndex({bool index, Color firstColor, Color secondColor}) {
  return TextStyle(
    color: index ? firstColor : secondColor,
    fontSize: 17.0,
    fontWeight: FontWeight.bold,
  );
}

CircleAvatar circleAvatar(String photoUser) {
  return CircleAvatar(
    radius: 32.0,
    backgroundImage: NetworkImage(photoUser),
  );
}
