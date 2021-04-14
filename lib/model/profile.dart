import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_chat/model/model.dart';

@immutable
class Profile {
  final String name;
  final String photoPath;
  final DateTime dateTime;
  final bool isSelected;
  final bool hidden;
  final String nickName;
  final String lastMessage;
  final List<Messages> messages;

  Profile(
      {this.name,
      this.photoPath,
      this.messages,
      this.dateTime,
      this.nickName,
      this.lastMessage,
      this.isSelected = false,
      this.hidden = false});

  Profile.initial(
      {this.name,
      this.photoPath,
      this.messages,
      this.dateTime,
      this.lastMessage,
      this.nickName})
      : isSelected = false,
        hidden = false;

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
          photoPath == other.photoPath &&
          name == other.name &&
          messages == other.messages &&
          dateTime == other.dateTime &&
          nickName == other.nickName &&
          hidden == other.hidden &&
          isSelected == other.isSelected;

  @override
  int get hashCode =>
      photoPath.hashCode ^
      name.hashCode ^
      messages.hashCode ^
      dateTime.hashCode ^
      hidden.hashCode ^
      nickName.hashCode ^
      isSelected.hashCode;
}

List<Profile> listUsers = <Profile>[
  Profile(
    lastMessage: " ",
    dateTime: DateTime.now(),
    nickName: "@john",
    name: 'John',
    photoPath:
        "https://user-images.githubusercontent.com/36184953/112576803-d4772400-8e14-11eb-8a38-310d33d306fa.png",
    messages: [],
  ),
  Profile(
    lastMessage: "Yaxshi",
    dateTime: DateTime.now().subtract(Duration(hours: 3)),
    nickName: "@madina",
    name: "Madina",
    photoPath:
        "https://user-images.githubusercontent.com/36184953/112577029-5e26f180-8e15-11eb-82ca-8de9bad5c48a.png",
    messages: [
      Messages(
        users: Users.isNotMe,
        message: "Qalaysan",
        dateTime: DateTime.now().subtract(Duration(hours: 5)),
      ),
      Messages(
        users: Users.isMe,
        message: "Yaxshi",
        dateTime: DateTime.now().subtract(Duration(hours: 3)),
      ),
    ],
  ),
  Profile(
    lastMessage: "Yaxshi",
    dateTime: DateTime.now().subtract(Duration(hours: 2)),
    nickName: "@muhayyo",
    name: "Muhayyo",
    photoPath:
        "https://user-images.githubusercontent.com/36184953/112577138-9c241580-8e15-11eb-80e3-d81bf3fe5f18.png",
    messages: [
      Messages(
        users: Users.isNotMe,
        message: "Qalaysan",
        dateTime: DateTime.now().subtract(Duration(hours: 8)),
      ),
      Messages(
        users: Users.isMe,
        message: "Yaxshi",
        dateTime: DateTime.now().subtract(Duration(hours: 7)),
      ),
      Messages(
        users: Users.isNotMe,
        message: "Qalaysan",
        dateTime: DateTime.now().subtract(Duration(hours: 6)),
      ),
      Messages(
        users: Users.isMe,
        message: "Yaxshi",
        dateTime: DateTime.now().subtract(Duration(hours: 2)),
      ),
    ],
  ),
  Profile(
    lastMessage: "Yaxshi",
    dateTime: DateTime.now(),
    nickName: "@musharraf",
    name: "Musharraf",
    photoPath:
        "https://user-images.githubusercontent.com/36184953/112577418-1fde0200-8e16-11eb-9a05-37a844bfd0de.png",
    messages: [
      Messages(
        users: Users.isNotMe,
        message: "Qalaysan",
        dateTime: DateTime.now().subtract(Duration(hours: 10)),
      ),
      Messages(
        users: Users.isMe,
        message: "Yaxshi",
        dateTime: DateTime.now().subtract(Duration(hours: 7)),
      ),
      Messages(
        users: Users.isNotMe,
        message: "Qalaysan",
        dateTime: DateTime.now().subtract(Duration(hours: 5)),
      ),
      Messages(
        users: Users.isMe,
        message: "Yaxshi",
        dateTime: DateTime.now().subtract(Duration(hours: 3)),
      ),
      Messages(
        users: Users.isNotMe,
        message: "Qalaysan",
        dateTime: DateTime.now().subtract(Duration(hours: 1)),
      ),
      Messages(
        users: Users.isMe,
        message: "Yaxshi",
        dateTime: DateTime.now(),
      ),
    ],
  ),
];
