import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model_vm.dart';

class HelperPRVM extends StateNotifier<HelperPR> {
  HelperPRVM(HelperPR state) : super(state);

  void userPhoto(Uint8List dataPhoto) {
    state = state.copyWith(dataPhoto: dataPhoto);
  }

  void index(int index) {
    state = state.copyWith(index: index);
  }

  void nameUser(String name) {
    state = state.copyWith(name: name);
  }

  void editContact(Edit edit) {
    state = state.copyWith(edit: edit);
  }
}

final helperPRPro =
    StateNotifierProvider((_) => HelperPRVM(HelperPR.initial()));
