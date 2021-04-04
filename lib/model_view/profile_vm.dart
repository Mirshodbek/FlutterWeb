import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model_vm.dart';

class ListProfile extends StateNotifier<List<Profile>> {
  ListProfile([List<Profile> state]) : super(state ?? []);

  void add(String description) {
    state = [
      ...state,
      Profile(
          index: state.length + 1,
          isSelected: false,
          name: "Mirshod",
          photoPath:
              "https://user-images.githubusercontent.com/36184953/112576803-d4772400-8e14-11eb-8a38-310d33d306fa.png"),
    ];
  }

  void search(String query) {
    state = searchListView.where((contacts) {
      final titleLower = contacts.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();
  }

  int get length {
    return state.length;
  }
}

final listProfilePro =
    StateNotifierProvider((ref) => ListProfile(searchListView));
