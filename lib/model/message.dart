import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:web_chat/desktop/desktop.dart';

@immutable
class Messages {
  final String message;
  final Uint8List dataPhoto;
  final Users users;
  final DateTime dateTime;

  Messages({this.message, this.dateTime, this.dataPhoto, this.users});
}

List<Messages> listMessages = <Messages>[];
