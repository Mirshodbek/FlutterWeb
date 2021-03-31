import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/model/profile.dart';

import 'model_vm.dart';

class ProfileVM extends StateNotifier<Profile> {
  ProfileVM(Profile state) : super(state);

  int index({int index}) {
    state = state.copyWith(index: index);
    return super.state.index;
  }

  bool isSelected(bool select) {
    state = state.copyWith(isSelected: select);

    return super.state.isSelected;
  }
}

final profilePro = StateNotifierProvider((_) => ProfileVM(Profile.initial()));

class ListProfile extends StateNotifier<List<Profile>> {
  ListProfile([List<Profile> state]) : super(state ?? []);

  void add(String description) {
    state = [
      ...state,
      Profile(
          isSelected: false,
          name: "Mirshod",
          photoPath:
              "https://user-images.githubusercontent.com/36184953/112576803-d4772400-8e14-11eb-8a38-310d33d306fa.png"),
    ];
  }

  int get length {
    return super.state.length;
  }
}

final listProfilePro = StateNotifierProvider(
    (ref) => ListProfile(ref.read(listContactsPro.state).toList()));
