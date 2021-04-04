import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneAuth extends StatelessWidget {
  final TextEditingController telephoneController;
  final double width;
  final double height;
  final String invalidPhone;

  PhoneAuth(
      {this.telephoneController, this.width, this.height, this.invalidPhone});

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
          child: TextField(
            maxLength: 13,
            key: UniqueKey(),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
            ],
            style: TextStyle(
              fontSize: 30.0,
            ),
            decoration: InputDecoration(
              errorText: invalidPhone,
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
