import 'package:flutter/material.dart';

import 'home.dart';
import 'user.dart';
import 'animatePage.dart';
import '../utils/route.dart';
// tmp
import '../tmp/animation.dart';
import 'sliverBar.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  createState() => new _AppState();
}

class _AppState extends State<App> {
  int _tabIndex = 0;

  List<BottomNavigationBarItem> _navigationViews;

  var appBarBottoms = ['Index', 'List', 'Animation', 'Mine'];

  PageController pageController;

  var _body;

  initData() {
    _body = IndexedStack(
      children: <Widget>[Home(), AnimateNum(), AnimatePage(), User()],
      index: _tabIndex,
    );
  }

  @override
  void initState() {
    super.initState();
    // 底部4个 tab 选项
    _navigationViews = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        title: new Text(appBarBottoms[0]),
        backgroundColor: Colors.blue,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.widgets),
        title: new Text(appBarBottoms[1]),
        backgroundColor: Colors.blue,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.favorite),
        title: new Text(appBarBottoms[2]),
        backgroundColor: Colors.blue,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        title: new Text(appBarBottoms[3]),
        backgroundColor: Colors.blue,
      ),
    ];
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
    initData();

    final Map<String, WidgetBuilder> _routers = _createRouter();

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryTextTheme: TextTheme(body1: TextStyle(color: Colors.white)),
        primaryColor: Colors.white,
        accentColor: Color(0xff6ea6fd),
      ),
      routes: _routers,
      home: Scaffold(
        body: _body,
        bottomNavigationBar: BottomNavigationBar(
          items: _navigationViews
              .map((BottomNavigationBarItem navigationView) => navigationView)
              .toList(),
          currentIndex: _tabIndex,
          fixedColor: Color(0xff6ea6fd),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
      ),
    );
  }
}
