import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_chat/screens/screens.dart';

class ProfileScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFE7EBF0),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Responsive(
          desktop: Center(
            child: Container(
              width: (Responsive.isDesktop(context)) ? 1000.0 : double.infinity,
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
          mobile: Column(
            children: [
              HeaderProfileMobile(),
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: Responsive.height(context),
                child: LeftColumn(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
