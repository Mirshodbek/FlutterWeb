import 'package:flutter/material.dart';

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
