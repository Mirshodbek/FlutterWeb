import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model_vm.dart';

class ListProfile extends StateNotifier<List<Profile>> {
  ListProfile([List<Profile> state]) : super(state ?? []);

  void add(String description) {
    state = [
      ...state,
      Profile(
        dateTime: DateTime.now(),
        lastMessage: " ",
        name: "Mirshod",
        photoPath:
            "https://user-images.githubusercontent.com/36184953/112576803-d4772400-8e14-11eb-8a38-310d33d306fa.png",
        messages: <Messages>[],
      ),
    ];
  }

  void search(String query) {
    final _state = state;
    for (int i = 0; i < _state.length; i++) {
      final titleLower = _state[i].name.toLowerCase();
      final searchLower = query.toLowerCase();

      _state[i] = Profile(
        dateTime: _state[i].dateTime,
        lastMessage: _state[i].lastMessage,
        name: _state[i].name,
        isSelected: _state[i].isSelected,
        photoPath: _state[i].photoPath,
        hidden: !titleLower.contains(searchLower),
        messages: _state[i].messages,
      );
    }
    state = _state;
  }

  void changeDateTime(int index, String lastMessage) {
    final _state = state;
    _state[index] = Profile(
      lastMessage: lastMessage,
      dateTime: DateTime.now(),
      name: _state[index].name,
      photoPath: _state[index].photoPath,
      messages: _state[index].messages,
    );

    state = _state;
  }
}

final listProfilePro = StateNotifierProvider((_) => ListProfile(listUsers));
