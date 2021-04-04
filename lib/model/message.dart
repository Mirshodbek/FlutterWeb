import 'package:flutter/material.dart';

@immutable
class Messages {
  final String message;
  final DateTime dateTime;

  Messages({this.message, this.dateTime});
}
