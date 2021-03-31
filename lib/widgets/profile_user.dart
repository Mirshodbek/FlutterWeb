import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/widgets/widgets.dart';

class ProfileUser extends ConsumerWidget {
  final Profile profiles;
  final Widget textWidget;
  final int index;

  ProfileUser({
    @required this.profiles,
    @required this.textWidget,
    this.index,
  });

  @override
  Widget build(BuildContext context, watch) {
    final profile = watch(profilePro.state);

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: circleAvatar(profiles.photoPath),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                profiles.name,
                style: textStyleIndex(
                    index: profile.index == index,
                    firstColor: Colors.white,
                    secondColor: Colors.black),
              ),
              SizedBox(
                height: 10.0,
              ),
              textWidget,
            ],
          ),
        ),
      ],
    );
  }
}
