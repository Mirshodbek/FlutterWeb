import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_chat/router/app_route_information_parser.dart';
import 'package:web_chat/screens/auth_screen.dart';
import 'package:web_chat/screens/profile_screen.dart';

class MyRouterDelegate extends RouterDelegate<MyRoutes>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutes> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyRoutes get configuration => _configuration;
  MyRoutes _configuration;

  set configuration(MyRoutes value) {
    if (_configuration == value) return;

    _configuration = value;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(MyRoutes configuration) async {
    _configuration = configuration;
  }

  // For web application
  @override
  MyRoutes get currentConfiguration => configuration;

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    final bool success = route.didPop(result);
    if (success) {
      _configuration = MyRoutes.registerScreen;
      notifyListeners();
    }
    return success;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: <Page<void>>[
        MaterialPage(
          key: ValueKey('register'),
          child: AuthorizationScreen(),
        ),
        if (configuration == MyRoutes.profileScreen)
          MaterialPage(
            key: ValueKey('profile'),
            child: ProfileScreen(),
          ),
      ],
      onPopPage: _handlePopPage,
    );
  }
}
