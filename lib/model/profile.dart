import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum User { profiles, contacts }

@immutable
class Profile {
  final String name;
  final String photoPath;
  final int index;
  final DateTime dateTime;
  final bool isSelected;
  final List<Messages> messages;

  Profile(
      {this.name,
      this.photoPath,
      this.index,
      this.messages,
      this.dateTime,
      this.isSelected});

  Profile.initial({this.name, this.photoPath, this.messages, this.dateTime})
      : index = 0,
        isSelected = false;

  Profile copyWith({int index, List<Messages> messages, bool isSelected}) {
    return Profile(
      index: index ?? this.index,
      messages: messages ?? this.messages,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

@immutable
class Messages {
  final String message;
  final DateTime dateTime;

  Messages({this.message, this.dateTime});
}
