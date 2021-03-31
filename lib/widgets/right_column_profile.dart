import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RightColumn extends ConsumerWidget {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context, watch) {
    // final profiles = watch(listContactsPro.state).toList();
    // final index = watch(profilePro.state);
    // final profileName = profiles[index.index];
    return Expanded(
      child: Stack(
        children: [
          // ListView(
          //   padding: EdgeInsets.only(bottom: 200.0),
          //   children: List.generate(
          //     message.messages.length ?? 0,
          //     (index) {
          //       return Padding(
          //         padding: EdgeInsets.only(top: 10.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             CircleAvatar(
          //               radius: 30.0,
          //               backgroundImage: NetworkImage(message.photoPath),
          //             ),
          //             SizedBox(
          //               width: 10.0,
          //             ),
          //             Expanded(
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 mainAxisSize: MainAxisSize.min,
          //                 crossAxisAlignment: CrossAxisAlignment.stretch,
          //                 children: [
          //                   Text(
          //                     message.name,
          //                     style: TextStyle(
          //                       fontSize: 18.0,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 15.0,
          //                   ),
          //                   Text(message.messages[index].message),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
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
                    backgroundColor: Colors.black,
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
                              onPressed: () {
                                _messageController.clear();
                              },
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
                  // circleAvatar(message.photoPath),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
