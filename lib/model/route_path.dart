import 'package:flutter/cupertino.dart';
import 'package:web_chat/model/model.dart';

@immutable
class RoutePath {
  final MyRoutes myRoute;
  final PageAuth pageAuth;

  RoutePath(this.myRoute, this.pageAuth);
}
