import 'package:flutter/material.dart';

import 'indexPage.dart';
import 'user.dart';
import 'animatePage.dart';
import '../tmp/animation.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';
  Home({Key key}) : super(key: key);

  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _tabIndex = 0;

  List<BottomNavigationBarItem> _navigationViews;

  var appBarBottoms = ['Index', 'List', 'Animation', 'Mine'];

  PageController pageController;

  var _body;

  initData() {
    _body = IndexedStack(
      children: <Widget>[Index(), AnimateNum(), AnimatePage(), User()],
      index: _tabIndex,
    );
  }

  @override
  void initState() {
    super.initState();
    // 底部4个 tab 选项
    _navigationViews = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        title: Text(appBarBottoms[0]),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.widgets),
        title: Text(appBarBottoms[1]),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.favorite),
        title: Text(appBarBottoms[2]),
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        title: Text(appBarBottoms[3]),
        backgroundColor: Colors.blue,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();

    return Scaffold(
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
    );
  }
}
