import 'package:flutter/material.dart';

import 'splashPage.dart';
// import 'homePage.dart';
import '../utils/route.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  createState() => new _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  final navigatorKey = GlobalKey<NavigatorState>();

  Map<String, WidgetBuilder> _createRouter() {
    return Map<String, WidgetBuilder>.fromIterable(
      routerList,
      key: (dynamic route) => '${route.routeName}',
      value: (dynamic route) => route.buildRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryTextTheme: TextTheme(body1: TextStyle(color: Colors.white)),
        primaryColor: Colors.white,
        accentColor: Color(0xff6ea6fd),
      ),
      routes: _createRouter(),
      home: SplashPage(),
    );
  }
}
