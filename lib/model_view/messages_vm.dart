import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/desktop/desktop.dart';

class ListMessages extends StateNotifier<List<Messages>> {
  ListMessages([List<Messages> state]) : super(state ?? []);

  Future<bool> add(String message) async {
    state = [
      ...state,
      Messages(
        users: Users.isMe,
        message: message,
        dateTime: DateTime.now(),
      ),
    ];
    return true;
  }
}

final listMessagesPro = StateNotifierProvider<ListMessages>((ref) {
  return ListMessages(listUsers[ref.watch(helperPRPro.state).index].messages);
});
