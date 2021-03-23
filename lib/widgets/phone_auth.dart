import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneAuth extends StatelessWidget {
  final TextEditingController telephoneController;
  final double width;
  final double height;

  PhoneAuth({this.telephoneController, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: height,
        ),
        SelectableText(
          "Sign In",
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30.0,
        ),
        SelectableText(
          "Enter your full phone number.",
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(
          height: 30.0,
        ),
        SelectableText(
          "Uzbekistan",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 40.0,
        ),
        SizedBox(
          width: width,
          child: TextFormField(
            key: UniqueKey(),
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
              errorStyle: TextStyle(
                fontSize: 20.0,
              ),
            ),
            controller: telephoneController,
          ),
        ),
        SizedBox(
          height: 100.0,
        ),
      ],
    );
  }
}
