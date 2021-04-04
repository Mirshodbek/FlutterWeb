import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/widgets/widgets.dart';

class ListContacts extends StateNotifier<List<Profile>> {
  ListContacts([List<Profile> state]) : super(state ?? []);
  List<Profile> _selectedContacts = [];

  void selectContact(int index) {
    state = [
      for (final contact in state)
        if (contact.index == state[index].index)
          Profile(
            index: contact.index,
            name: contact.name,
            isSelected: !contact.isSelected,
            photoPath: contact.photoPath,
          )
        else
          contact,
    ];
    final _select = _selectedContacts.contains(state[index]);
    if (_select) {
      _selectedContacts.remove(state[index]);
    } else {
      _selectedContacts.add(state[index]);
    }
  }

  void cancelDelete() {
    state = [
      for (final contact in state)
        if (contact.isSelected)
          Profile(
            index: contact.index,
            name: contact.name,
            isSelected: !contact.isSelected,
            photoPath: contact.photoPath,
          )
        else
          contact
    ];
    _selectedContacts = [];
  }

  void add({String name}) {
    state = [
      ...state,
      Profile(
          index: state.length + 1,
          isSelected: false,
          name: name,
          photoPath:
              "https://user-images.githubusercontent.com/36184953/112576803-d4772400-8e14-11eb-8a38-310d33d306fa.png"),
    ];
    searchListView = state;
  }

  void search(String query) {
    state = searchListView.where((contacts) {
      final titleLower = contacts.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();
  }

  void delete() {
    for (int i = 0; i < _selectedContacts.length; i++)
      state =
          state.where((element) => element != _selectedContacts[i]).toList();

    searchListView = state;
    _selectedContacts = [];
  }

  bool onPressed() {
    if (lengthDeletedContacts > 0)
      return true;
    else
      return false;
  }

  int get lengthDeletedContacts {
    return _selectedContacts.length;
  }

  int get lengthContacts {
    return state.length;
  }
}

final listContactsPro =
    StateNotifierProvider((ref) => ListContacts(searchListView));
