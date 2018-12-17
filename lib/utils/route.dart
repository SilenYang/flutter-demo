import 'package:flutter/material.dart';
import '../pages/sliverBar.dart';
import '../demoPages/page2.dart';

List<RouteData> routerList = <RouteData>[
  RouteData(
    routeName: SliverBar.routeName,
    buildRoute: (BuildContext context) => SliverBar(),
  ),
  RouteData(
    routeName: Page2.routeName,
    buildRoute: (BuildContext context) => Page2('from page1'),
  ),
];

class RouteData {
  const RouteData({@required this.routeName, @required this.buildRoute});

  final String routeName;
  final WidgetBuilder buildRoute;

  @override
  String toString() {
    return '$runtimeType($routeName $routeName)';
  }
}
