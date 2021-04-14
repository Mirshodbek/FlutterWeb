import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:web_chat/desktop/desktop.dart';

class RightColumn extends ConsumerWidget {
  final _messageController = TextEditingController();

  void _send(BuildContext context, int index) async {
    final messages = _messageController.text;
    if (messages.isNotEmpty) {
      final time = await context.read(listMessagesPro).add(messages);
      if (time) context.read(listProfilePro).changeDateTime(index, messages);
    }
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context, watch) {
    final profiles = watch(listProfilePro.state).toList();
    final helper = watch(helperPRPro.state);
    final profile = profiles[helper.index];

    final messages = watch(listMessagesPro.state).reversed.toList();
    return Expanded(
      child: Stack(
        children: [
          ListView(
            reverse: true,
            padding: EdgeInsets.only(bottom: 200.0, left: 80.0, right: 80.0),
            children: List.generate(
              messages.length ?? 0,
              (index) {
                final message = messages[index];
                return Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: (helper.dataPhoto != null)
                            ? MemoryImage(helper.dataPhoto)
                            : NetworkImage(
                                (message.users == Users.isMe)
                                    ? defaultPhotoUser
                                    : profile.photoPath,
                              ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SelectableText(
                                  (helper.name != null)
                                      ? helper.name
                                      : (message.users == Users.isMe)
                                          ? "Mirshod"
                                          : profile.name,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(DateFormat.jms().format(message.dateTime)),
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            SelectableText(message.message),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              color: Colors.white,
              height: 150.0,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: (helper.dataPhoto != null)
                        ? MemoryImage(helper.dataPhoto)
                        : NetworkImage(defaultPhotoUser),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextField(
                          key: UniqueKey(),
                          controller: _messageController,
                          autofocus: true,
                          minLines: 2,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: "Write a message...",
                            suffixIcon: Icon(
                              Icons.face,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.insert_drive_file,
                                      size: 30.0,
                                      color: Colors.black38,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.black38,
                                      size: 30.0,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.keyboard_voice_outlined,
                                      color: Colors.black38,
                                      size: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () => _send(context, helper.index),
                              child: Text(
                                "Send",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  circleAvatar(profile.photoPath),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
