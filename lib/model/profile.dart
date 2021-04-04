import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_chat/model/model.dart';

@immutable
class Profile {
  final String name;
  final String photoPath;
  final DateTime dateTime;
  final int index;
  final bool isSelected;
  final String nickName;
  final List<Messages> messages;

  Profile(
      {this.name,
      this.photoPath,
      this.messages,
      this.index,
      this.dateTime,
      this.nickName,
      this.isSelected});

  Profile.initial(
      {this.name,
      this.photoPath,
      this.messages,
      this.dateTime,
      this.index,
      this.nickName})
      : isSelected = false;

  Profile copyWith({List<Messages> messages}) {
    return Profile(
      messages: messages ?? this.messages,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Profile &&
          runtimeType == other.runtimeType &&
          index == other.index &&
          photoPath == other.photoPath &&
          name == other.name &&
          messages == other.messages &&
          dateTime == other.dateTime &&
          isSelected == other.isSelected;

  @override
  int get hashCode =>
      index.hashCode ^
      photoPath.hashCode ^
      name.hashCode ^
      messages.hashCode ^
      dateTime.hashCode ^
      isSelected.hashCode;
}

List<Profile> searchListView = <Profile>[
  Profile(
    nickName: "@john",
    isSelected: false,
    index: 0,
    name: 'John',
    photoPath:
        "https://user-images.githubusercontent.com/36184953/112576803-d4772400-8e14-11eb-8a38-310d33d306fa.png",
    messages: [],
  ),
  Profile(
    nickName: "@madina",
    isSelected: false,
    index: 1,
    name: "Madina",
    photoPath:
        "https://user-images.githubusercontent.com/36184953/112577029-5e26f180-8e15-11eb-82ca-8de9bad5c48a.png",
    messages: [
      // Messages(message: "Qalaysan"),
      // Messages(message: "Yaxshi"),
    ],
  ),
  Profile(
    nickName: "@muhayyo",
    isSelected: false,
    index: 2,
    name: "Muhayyo",
    photoPath:
        "https://user-images.githubusercontent.com/36184953/112577138-9c241580-8e15-11eb-80e3-d81bf3fe5f18.png",
    messages: [],
  ),
  Profile(
    nickName: "@musharraf",
    isSelected: false,
    index: 3,
    name: "Musharraf",
    photoPath:
        "https://user-images.githubusercontent.com/36184953/112577418-1fde0200-8e16-11eb-9a05-37a844bfd0de.png",
    messages: [],
  ),
];
