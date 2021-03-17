import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_chat/router/app_route_information_parser.dart';
import 'package:web_chat/router/app_router_delegate.dart';

class AuthorizationScreen extends StatelessWidget {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          PhonePart(pageController),
          AccessProfile(pageController),
        ],
      ),
    );
  }
}

class PhonePart extends StatelessWidget {
  final PageController pageController;

  PhonePart(this.pageController);

  final _formKey = GlobalKey<FormState>();

  final _telephoneController = TextEditingController(
    text: "+998",
  );

  void nextPage() {
    if (_formKey.currentState.validate()) {
      pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Phone Number",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Please enter your mobile phone number",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 150,
            ),
            SizedBox(
              width: 300.0,
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
                ],
                validator: (value) {
                  if (value.length < 4) {
                    return "Invalid telephone";
                  }
                  return null;
                },
                controller: _telephoneController,
                style: TextStyle(
                  fontSize: 30.0,
                ),
                decoration: InputDecoration(
                  focusColor: Colors.blue,
                  errorStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
              ),
              onPressed: () {
                nextPage();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Authorization",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Icon(
                    Icons.chevron_right_sharp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccessProfile extends StatelessWidget {
  final PageController pageController;

  AccessProfile(this.pageController);

  final _formKey = GlobalKey<FormState>();

  final _keyController = TextEditingController();

  void previousPage() {
    pageController.previousPage(
        duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
  }

  void nextScreen(BuildContext context) {
    if (_formKey.currentState.validate()) {
      (Router.of(context).routerDelegate as MyRouterDelegate).configuration =
          MyRoutes.profileScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                previousPage();
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300.0,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                    controller: _keyController,
                    validator: (value) {
                      if (value.length < 4) {
                        return "Invalid Key";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                  ),
                  onPressed: () {
                    nextScreen(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Start Chatting",
                        style: TextStyle(fontSize: 30.0),
                      ),
                      Icon(
                        Icons.chevron_right_sharp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
