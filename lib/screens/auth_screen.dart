import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_html/html.dart' as html;
import 'package:web_chat/screens/screens.dart';

class Auth extends StatefulWidget {
  final PageAuth pageAuthTab;

  Auth(this.pageAuthTab);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  void didUpdateWidget(covariant Auth oldWidget) {
    super.didUpdateWidget(oldWidget);
    context
        .refresh(authorizationPro)
        .pageAuth(pageAuth: widget.pageAuthTab, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthorizationScreen(),
    );
  }
}

class AuthorizationScreen extends ConsumerWidget {
  final _telephoneController = TextEditingController(
    text: "+998",
  );
  final _codeController = TextEditingController();
  final _nameController = TextEditingController();
  final authorization = Authorization();

  void save(BuildContext context) {
    final MyRouterDelegate state =
        Router.of(context).routerDelegate as MyRouterDelegate;

    Router.navigate(context, () {
      state.pageAuth = authorization.pageAuth;
    });
  }

  Widget _alertDialog(BuildContext context, String telephone) {
    return AlertDialog(
      actionsPadding: EdgeInsets.all(10.0),
      titlePadding: EdgeInsets.all(20.0),
      title: Text(
        "Is it correct?",
        style: TextStyle(
          fontSize: 40.0,
        ),
      ),
      content: Text(
        telephone,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await context
                .read(authorizationPro)
                .telephoneStep(telephone: telephone);

            Navigator.of(context).pop();
          },
          child: Text(
            "Ok",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        TextButton(
          onPressed: () {
            context
                .read(authorizationPro)
                .pageAuth(pageAuth: PageAuth.codePage);

            Navigator.pop(context);
          },
          child: Text(
            "Cancel",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    );
  }

  void nextPage(BuildContext context, Authorization auth) async {
    final _telephone = _telephoneController.text;
    final _code = _codeController.text;
    final _name = _nameController.text;

    if (auth.pageAuth == PageAuth.phonePage) {
      if (_telephone.length >= 13) {
        showDialog(
          context: context,
          builder: (context) {
            return _alertDialog(context, _telephone);
          },
        );
        save(context);
      } else {
        context.read(helperAuthPro).invalidPhone();
      }
    }

    if (auth.pageAuth == PageAuth.codePage) {
      if (_code == auth.randomCodes.toString()) {
        await context.read(authorizationPro).codeStep(code: _code);
      } else {
        _codeController.clear();
        context.read(helperAuthPro).invalidCode();
      }
    }

    if (auth.pageAuth == PageAuth.dataPage) {
      if (_name.isNotEmpty) {
        await context.read(authorizationPro).dataStep(name: _name);
        (Router.of(context).routerDelegate as MyRouterDelegate).myRoutes =
            MyRoutes.profileScreen;
      } else {
        context.read(helperAuthPro).emptyName();
      }
    }
  }

  void previousPage(BuildContext context) {
    context.read(authorizationPro).pageAuth(pageAuth: PageAuth.phonePage);
  }

  void pickImage(BuildContext context) {
    final html.InputElement input = html.document.createElement('input');
    input
      ..type = 'file'
      ..accept = 'image/*';

    input.onChange.listen((e) {
      if (input.files.isEmpty) return;
      final reader = html.FileReader();
      reader.readAsDataUrl(input.files.first);
      reader.onError.listen((err) {
        context.read(authorizationPro).photoUser(errorPhoto: err.toString());
      });
      reader.onLoad.first.then((res) {
        final encoded = reader.result as String;
        final stripped =
            encoded.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');
        context.read(authorizationPro).photoUser(
              pathPhoto: input.files.first.name,
              dataPhoto: base64.decode(stripped),
              errorPhoto: '',
            );
      });
    });

    input.click();
  }

  @override
  Widget build(BuildContext context, watch) {
    final auth = watch(authorizationPro.state);
    final helperAuth = watch(helperAuthPro.state);

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
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Responsive(
                  desktop: IntrinsicHeight(
                    child: IntrinsicWidth(
                      child: Column(
                        children: [
                          HeaderAuth(
                            () => nextPage(context, auth),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          if (auth.pageAuth == PageAuth.phonePage)
                            PhoneAuth(
                              invalidPhone: helperAuth.invalidPhone,
                              telephoneController: _telephoneController,
                              width: 300.0,
                              height: 40.0,
                            ),
                          if (auth.pageAuth == PageAuth.codePage)
                            CodeAuth(
                              invalidCode: helperAuth.invalidCode,
                              auth: auth,
                              previousPage: () => previousPage(context),
                              codeController: _codeController,
                              width: 150.0,
                              height: 40.0,
                            ),
                          if (auth.pageAuth == PageAuth.dataPage)
                            DataWidget(
                              emptyName: helperAuth.emptyName,
                              auth: auth,
                              selectImage: () => pickImage(context),
                              nameController: _nameController,
                            ),
                        ],
                      ),
                    ),
                  ),
                  mobile: SizedBox(
                    height: Responsive.height(context),
                    child: Column(
                      children: [
                        HeaderAuth(
                          () => nextPage(context, auth),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        if (auth.pageAuth == PageAuth.phonePage)
                          PhoneAuth(
                            invalidPhone: helperAuth.invalidPhone,
                            telephoneController: _telephoneController,
                            width: 300.0,
                            height: 180.0,
                          ),
                        if (auth.pageAuth == PageAuth.codePage)
                          CodeAuth(
                            invalidCode: helperAuth.invalidCode,
                            auth: auth,
                            previousPage: () => previousPage(context),
                            codeController: _codeController,
                            width: 150.0,
                            height: 180.0,
                          ),
                        if (auth.pageAuth == PageAuth.dataPage)
                          DataWidget(
                            emptyName: helperAuth.emptyName,
                            auth: auth,
                            selectImage: () => pickImage(context),
                            nameController: _nameController,
                          ),
                      ],
                    ),
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
