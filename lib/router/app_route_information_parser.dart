import 'package:flutter/material.dart';
import 'package:web_chat/screens/screens.dart';

class AppRouteInformationParser extends RouteInformationParser<MyRoutes> {
  @override
  Future<MyRoutes> parseRouteInformation(
      RouteInformation routeInformation) async {
    switch (routeInformation.location) {
      case "/register":
        return MyRoutes.registerScreen;
        break;
      case "/im?p=":
        return MyRoutes.profileScreen;
        break;
      default:
        return MyRoutes.registerScreen;
    }
  }

  @override
  RouteInformation restoreRouteInformation(MyRoutes configuration) {
    switch (configuration) {
      case MyRoutes.registerScreen:
        return const RouteInformation(location: '/register');
      case MyRoutes.profileScreen:
        return const RouteInformation(location: '/im?p=');
    }
    throw 'unknown';
  }
}
