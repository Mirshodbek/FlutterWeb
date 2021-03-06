import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_chat/router/app_route_information_parser.dart';
import 'package:web_chat/router/app_router_delegate.dart';

void main() {
  runApp(
    ProviderScope(
      child: WebChat(),
    ),
  );
}

class WebChat extends StatefulWidget {
  @override
  _WebChatState createState() => _WebChatState();
}

class _WebChatState extends State<WebChat> {
  MyRouterDelegate _routerDelegate = MyRouterDelegate();

  AppRouteInformationParser _routeInformationParser =
      AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Web Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
    );
  }
}
