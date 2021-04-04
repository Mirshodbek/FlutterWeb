import 'package:flutter/material.dart';

@immutable
class HelperAuth {
  final String invalidPhone;
  final String invalidCode;
  final String emptyName;

  HelperAuth({this.invalidPhone, this.invalidCode, this.emptyName});

  HelperAuth.initial()
      : invalidPhone = null,
        invalidCode = null,
        emptyName = null;

  HelperAuth copyWith(
      {String invalidPhone, String invalidCode, String emptyName}) {
    return HelperAuth(
      invalidPhone: invalidPhone ?? this.invalidPhone,
      invalidCode: invalidCode ?? this.invalidCode,
      emptyName: emptyName ?? this.emptyName,
    );
  }
}
