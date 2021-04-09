import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/widgets/widgets.dart';

class LeftColumn extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final profiles = watch(listProfilePro.state).toList();
    final profile = watch(helperPRPro.state);
    return SizedBox(
      width:
          (Responsive.isDesktop(context)) ? 350.0 : Responsive.width(context),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 75.0,
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: context.read(listProfilePro).search,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.black26),
                prefixIcon: Icon(
                  Icons.search,
                  size: 25.0,
                  color: Colors.black26,
                ),
                filled: true,
                fillColor: Color(0xFFE7EBF0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Divider(
            height: 2.0,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: 10.0,
              ),
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                final profileUser = profiles[index];
                return TextButton(
                  onPressed: () => context.read(helperPRPro).index(index),
                  style: TextButton.styleFrom(
                    backgroundColor:
                        profile.index == index ? Colors.blue : Colors.white,
                  ),
                  child: ProfileUser(
                    index: index,
                    profiles: profileUser,
                    textWidget: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "You:",
                            style: textStyleIndex(
                                index: profile.index == index,
                                firstColor: Colors.white,
                                secondColor: Colors.blue),
                          ),
                          TextSpan(
                            text: " Rahmat Yaxshi",
                            style: textStyleIndex(
                              index: profile.index == index,
                              firstColor: Colors.white,
                              secondColor: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
