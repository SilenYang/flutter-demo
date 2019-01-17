import 'package:flutter/material.dart';
import 'HeroAnimationPageB.dart';
import '../appBar.dart';

class HeroAnimationRoute extends StatelessWidget {
  static const String routeName = 'Hero';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Hero动画示例').getAppBar(),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
            child: ClipOval(
              child: Image.asset(
                "assets/images/default_avatar.png",
                width: 20.0,
              ),
            ),
          ),
          onTap: () {
            //打开B路由
            Navigator.push(context, PageRouteBuilder(pageBuilder:
                (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
              return new FadeTransition(
                opacity: animation,
                child: HeroAnimationRouteB(),
              );
            }));
          },
        ),
      ),
    );
  }
}
