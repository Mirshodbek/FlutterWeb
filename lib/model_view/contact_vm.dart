import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/widgets/widgets.dart';

class ListContacts extends StateNotifier<List<Profile>> {
  ListContacts([List<Profile> state]) : super(state ?? []);

  List<Profile> selectedContacts = [];

  bool selectContact({int index}) {
    final select = selectedContacts.contains(state[index]);
    if (select)
      selectedContacts.remove(state[index]);
    else
      selectedContacts.add(state[index]);

    return select;
  }

  void delete() {
    for (int i = 0; i < selectedContacts.length; i++)
      state = state.where((element) => element != selectedContacts[i]).toList();

    selectedContacts = [];
  }

  void add({String name}) {
    state = [
      ...state,
      Profile(
          isSelected: false,
          name: name,
          photoPath:
              "https://user-images.githubusercontent.com/36184953/112576803-d4772400-8e14-11eb-8a38-310d33d306fa.png"),
    ];
  }

  int get length {
    return super.state.length;
  }
}

final listContactsPro = StateNotifierProvider(
  (_) => ListContacts([
    Profile(
      index: 0,
      isSelected: false,
      name: 'John',
      photoPath:
          "https://user-images.githubusercontent.com/36184953/112576803-d4772400-8e14-11eb-8a38-310d33d306fa.png",
      messages: [],
    ),
    Profile(
      index: 1,
      isSelected: false,
      name: "Madina",
      photoPath:
          "https://user-images.githubusercontent.com/36184953/112577029-5e26f180-8e15-11eb-82ca-8de9bad5c48a.png",
      messages: [
        // Messages(message: "Qalaysan"),
        // Messages(message: "Yaxshi"),
      ],
    ),
    Profile(
      index: 2,
      isSelected: false,
      name: "Muhayyo",
      photoPath:
          "https://user-images.githubusercontent.com/36184953/112577138-9c241580-8e15-11eb-80e3-d81bf3fe5f18.png",
      messages: [],
    ),
    Profile(
      index: 3,
      isSelected: false,
      name: "Musharraf",
      photoPath:
          "https://user-images.githubusercontent.com/36184953/112577418-1fde0200-8e16-11eb-9a05-37a844bfd0de.png",
      messages: [],
    ),
  ]),
);
