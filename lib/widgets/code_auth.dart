import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_chat/widgets/widgets.dart';

class CodeAuth extends StatelessWidget {
  final Authorization auth;
  final Function previousPage;
  final TextEditingController codeController;
  final double width;
  final double height;

  CodeAuth({
    this.auth,
    this.previousPage,
    this.codeController,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height,
        ),
        SelectableText(
          auth.telephone,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextButton(
          onPressed: previousPage,
          child: Text(
            "Edit Phone Number",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: 350.0,
          height: 100.0,
          child: SelectableText(
            "We have sent code to the Telegram app on your other device. Please enter the code below.",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Send via SMS",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: width,
          child: TextField(
            maxLength: 4,
            controller: codeController,
            style: TextStyle(
              fontSize: 30.0,
            ),
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: 20.0,
              ),
              hintText: "Enter your code",
              errorStyle: TextStyle(
                fontSize: 20.0,
              ),
            ),
            textAlign: TextAlign.center,
            key: UniqueKey(),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ],
          ),
        ),
        Text(
          auth.randomCodes.toString(),
        ),
        SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}
