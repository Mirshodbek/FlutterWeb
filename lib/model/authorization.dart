import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

enum PageAuth { phonePage, codePage, dataPage }

@immutable
class Authorization {
  final randomCode = (Random().nextInt(8999) + 1000);

  final String telephone;
  final String code;
  final String name;
  final PageAuth pageAuth;
  final Uint8List dataPhoto;
  final String pathPhoto;
  final String errorPhoto;

  Authorization(
      {this.telephone,
      this.code,
      this.name,
      this.pageAuth,
      this.dataPhoto,
      this.pathPhoto,
      this.errorPhoto});

  Authorization.initial()
      : telephone = '',
        code = '',
        name = '',
        pageAuth = PageAuth.phonePage,
        pathPhoto = '',
        errorPhoto = '',
        dataPhoto = null;

  Authorization copyWith(
      {String telephone,
      String code,
      String name,
      PageAuth pageAuth,
      Uint8List dataPhoto,
      String pathPhoto,
      String errorPhoto}) {
    return Authorization(
      telephone: telephone ?? this.telephone,
      code: code ?? this.code,
      name: name ?? this.name,
      pageAuth: pageAuth ?? this.pageAuth,
      pathPhoto: pathPhoto ?? this.pathPhoto,
      errorPhoto: errorPhoto ?? this.errorPhoto,
      dataPhoto: dataPhoto ?? this.dataPhoto,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Authorization &&
          runtimeType == other.runtimeType &&
          telephone == other.telephone &&
          code == other.code &&
          pageAuth == other.pageAuth &&
          errorPhoto == other.errorPhoto &&
          dataPhoto == other.dataPhoto &&
          pathPhoto == other.pathPhoto &&
          name == other.name;

  @override
  int get hashCode =>
      telephone.hashCode ^
      code.hashCode ^
      pageAuth.hashCode ^
      name.hashCode ^
      errorPhoto.hashCode ^
      dataPhoto.hashCode ^
      pathPhoto.hashCode;

  int get randomCodes {
    return randomCode;
  }
}
