import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_chat/responsive.dart';

class AuthorizationScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = Responsive.isDesktop(context)
        ? (Responsive.width(context) / 3)
        : Responsive.width(context);
    final height = Responsive.isDesktop(context)
        ? (Responsive.height(context) / 2)
        : Responsive.height(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Color(0xFF5682A3),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Color(0xFFE7EBF0),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Responsive(
              mobile: RegisterDesktop(
                minMax: false,
              ),
              tablet: RegisterDesktop(
                minMax: false,
              ),
              desktop: IntrinsicWidth(
                child: IntrinsicHeight(
                  child: RegisterDesktop(
                    minMax: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterDesktop extends ConsumurWidget {
  final _formKey = GlobalKey<FormState>();

  final _telephoneController = TextEditingController(
    text: "+998",
  );
  final bool minMax;

  RegisterDesktop({@required this.minMax});

  void nextPage() {
    if (_formKey.currentState.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Center(
              child: Container(
                color: Color(0xFF5682A3),
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Row(
                        children: [
                          Icon(
                            Icons.send_outlined,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "WebChat",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 4,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: minMax ? 40.0 : 180.0,
                  ),
                  SelectableText(
                    "Sign In",
                    style:
                        TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SelectableText(
                    "Enter your full phone number.",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SelectableText(
                    "Uzbekistan",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 30),
                        focusColor: Colors.blue,
                        errorStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      controller: _telephoneController,
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
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
