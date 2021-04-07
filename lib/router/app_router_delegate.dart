import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_chat/screens/auth_screen.dart';
import 'package:web_chat/screens/screens.dart';

class MyRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyRoutes get myRoutes => _myRoutes;
  MyRoutes _myRoutes;

  set myRoutes(MyRoutes value) {
    if (_myRoutes == value) return;
    _myRoutes = value;
    notifyListeners();
  }

  PageAuth get pageAuth => _pageAuth;
  PageAuth _pageAuth;
  set pageAuth(PageAuth value) {
    if (_pageAuth == value) return;
    _pageAuth = value;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    _myRoutes = configuration.myRoute;
    _pageAuth = configuration.pageAuth ?? PageAuth.phonePage;
  }

  // For web application
  @override
  RoutePath get currentConfiguration => RoutePath(myRoutes, pageAuth);

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    final bool success = route.didPop(result);
    if (success) {
      _myRoutes = MyRoutes.registerScreen;
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
          child: Auth(_pageAuth),
        ),
        if (myRoutes == MyRoutes.profileScreen)
          MaterialPage(
            key: ValueKey('im?p='),
            child: ProfileScreen(),
          ),
      ],
      onPopPage: _handlePopPage,
    );
  }
}
