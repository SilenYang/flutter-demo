import 'package:flutter/material.dart';

import '../pages/sliverBar.dart';
import '../pages/homePage.dart';
import '../pages/splashPage.dart';
import '../pages/list.dart' as ScrollList;
import '../components/animationDemo/animation.dart';

Map<String, Widget> pages = {
  "qw": SliverBar(),
  SliverBar.routeName: SliverBar(),
  Home.routeName: Home(),
  SplashPage.routeName: SplashPage(),
  ScrollList.List.routerName: ScrollList.List(),
  AnimateNum.routeName: AnimateNum(),
};
