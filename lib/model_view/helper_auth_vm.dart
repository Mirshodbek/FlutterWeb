import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/model_view/model_vm.dart';

class HelperAuthVM extends StateNotifier<HelperAuth> {
  HelperAuthVM(HelperAuth state) : super(state);

  void invalidPhone() {
    state = state.copyWith(invalidPhone: "Invalid Phone");
  }

  void invalidCode() {
    state = state.copyWith(invalidCode: "Invalid Code");
  }

  void emptyName() {
    state = state.copyWith(emptyName: "Empty Name");
  }
}

final helperAuthPro =
    StateNotifierProvider((_) => HelperAuthVM(HelperAuth.initial()));
