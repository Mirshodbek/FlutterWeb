import 'package:flutter/material.dart';
import 'package:web_chat/model/model.dart';

@immutable
class HelperPR {
  final int index;
  final Edit edit;

  HelperPR({this.index, this.edit});

  HelperPR.initial()
      : index = 0,
        edit = Edit.noEdit;

  HelperPR copyWith({int index, Edit edit}) {
    return HelperPR(
      index: index ?? this.index,
      edit: edit ?? this.edit,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HelperPR &&
          runtimeType == other.runtimeType &&
          index == other.index &&
          edit == other.edit;

  @override
  int get hashCode => index.hashCode ^ edit.hashCode;
}
