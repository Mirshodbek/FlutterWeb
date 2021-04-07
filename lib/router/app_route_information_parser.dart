import 'package:flutter/material.dart';
import 'package:web_chat/screens/screens.dart';

class AppRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    switch (routeInformation.location) {
      case "/register":
        return RoutePath(MyRoutes.registerScreen, routeInformation.state);
        break;
      case "/im?p=":
        return RoutePath(MyRoutes.profileScreen, routeInformation.state);
        break;
      default:
        return RoutePath(MyRoutes.registerScreen, routeInformation.state);
    }
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath configuration) {
    switch (configuration.myRoute) {
      case MyRoutes.registerScreen:
        return RouteInformation(
            location: '/register', state: configuration.pageAuth);
      case MyRoutes.profileScreen:
        return RouteInformation(
            location: '/im?p=', state: configuration.pageAuth);
    }
    throw 'unknown';
  }
}
