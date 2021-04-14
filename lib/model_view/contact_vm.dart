import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/widgets/widgets.dart';

class ListContacts extends StateNotifier<List<Profile>> {
  ListContacts([List<Profile> state]) : super(state ?? []);

  void toggleContact(int index) {
    final _state = state;
    final contact = state[index];
    _state[index] = Profile(
      lastMessage: _state[index].lastMessage,
      dateTime: _state[index].dateTime,
      name: contact.name,
      isSelected: !contact.isSelected,
      photoPath: contact.photoPath,
      messages: contact.messages,
    );
    state = _state;
  }

  int get lengthDeletedContacts {
    return state.where((element) => element.isSelected).length;
  }

  void cancelDelete() {
    final _state = state;
    for (int i = 0; i < _state.length; i++)
      if (_state[i].isSelected) {
        _state[i] = Profile(
          lastMessage: _state[i].lastMessage,
          dateTime: _state[i].dateTime,
          name: _state[i].name,
          isSelected: !_state[i].isSelected,
          photoPath: _state[i].photoPath,
          messages: _state[i].messages,
        );
      }
  }

  void add({String name}) {
    state = [
      ...state,
      Profile(
        lastMessage: " ",
        dateTime: DateTime.now(),
        name: name,
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

  void delete() {
    final _state = state;
    state = _state.where((element) => !element.isSelected).toList();
  }

  bool onPressed() {
    if (lengthDeletedContacts > 0)
      return true;
    else
      return false;
  }
}

final listContactsPro = StateNotifierProvider((ref) => ListContacts(listUsers));
