import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/model/authorization.dart';
import 'package:web_chat/model_view/model_vm.dart';

class AuthorizationVM extends StateNotifier<Authorization> {
  AuthorizationVM(Authorization state) : super(state);

  void authorization({String telephone}) {
    state = state.copyWith(telephone: telephone);
  }

  Future<void> telephoneStep({String telephone}) async {
    state = state.copyWith(telephone: telephone);
    try {
      state = state.copyWith(pageAuth: PageAuth.codePage);
    } catch (e) {}
  }

  Future<void> codeStep({String code, PageAuth pageAuth}) async {
    state = state.copyWith(code: code);
    try {
      state = state.copyWith(pageAuth: PageAuth.dataPage);
    } catch (e) {}
  }

  Future<void> dataStep({String name}) async {
    state = state.copyWith(name: name);
    try {} catch (e) {}
  }

  void photoUser({String errorPhoto, String pathPhoto, Uint8List dataPhoto}) {
    state = state.copyWith(
        pathPhoto: pathPhoto, errorPhoto: errorPhoto, dataPhoto: dataPhoto);
  }

  void pageAuth({PageAuth pageAuth, BuildContext context}) {
    state = state.copyWith(pageAuth: pageAuth);
  }
}

final authorizationPro =
    StateNotifierProvider((_) => AuthorizationVM(Authorization.initial()));
