import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:web_chat/model/model.dart';

@immutable
class HelperPR {
  final int index;
  final Uint8List dataPhoto;
  final String name;
  final Edit edit;

  HelperPR({this.index, this.edit, this.dataPhoto, this.name});

  HelperPR.initial()
      : index = 0,
        edit = Edit.noEdit,
        name = null,
        dataPhoto = null;

  HelperPR copyWith({int index, Edit edit, Uint8List dataPhoto, String name}) {
    return HelperPR(
      index: index ?? this.index,
      edit: edit ?? this.edit,
      dataPhoto: dataPhoto ?? this.dataPhoto,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HelperPR &&
          runtimeType == other.runtimeType &&
          index == other.index &&
          edit == other.edit &&
          dataPhoto == other.dataPhoto;

  @override
  int get hashCode => index.hashCode ^ edit.hashCode ^ dataPhoto.hashCode;
}
