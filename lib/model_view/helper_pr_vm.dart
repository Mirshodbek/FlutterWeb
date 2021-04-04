import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model_vm.dart';

class HelperPRVM extends StateNotifier<HelperPR> {
  HelperPRVM(HelperPR state) : super(state);

  void index(int index) {
    state = state.copyWith(index: index);
  }

  void editContact(Edit edit) {
    state = state.copyWith(edit: edit);
  }
}

final helperPRPro =
    StateNotifierProvider((_) => HelperPRVM(HelperPR.initial()));
