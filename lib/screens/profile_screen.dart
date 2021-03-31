import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/screens/screens.dart';

class ProfileScreen extends ConsumerWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFE7EBF0),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Container(
            width: 1000.0,
            child: Column(
              children: [
                HeaderProfile(),
                SizedBox(
                  height: 1.0,
                ),
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Row(
                    children: [
                      LeftColumn(),
                      RightColumn(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
