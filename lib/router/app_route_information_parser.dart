import 'package:flutter/material.dart';

enum MyRoutes { registerScreen, profileScreen }

class AppRouteInformationParser extends RouteInformationParser<MyRoutes> {
  @override
  Future<MyRoutes> parseRouteInformation(
      RouteInformation routeInformation) async {
    switch (routeInformation.location) {
      case "/register":
        return MyRoutes.registerScreen;
        break;
      case "/profile":
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
        return const RouteInformation(location: '/profile');
    }
    throw 'unknown';
  }
}
