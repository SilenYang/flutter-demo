import 'package:flutter/material.dart';
import '../components/appBar.dart';

// router widget
import 'sliverBar.dart';
import 'splashPage.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Mine',
        titleColor: Colors.purple,
      ).getAppBar(),
      body: Container(
        color: Color(0xffffffff),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 30.0, top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '杨柳岸晓风残月丶',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 74.0,
                      height: 74.0,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/default_avatar.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 18.0,
              width: double.infinity,
            ),
            ListItem(
              name: 'sliverAppBar示例',
              type: 'binding',
              route: SliverBar.routeName,
            ),
            ListItem(
              name: '启动页示例',
              type: 'achieve',
              route: SplashPage.routeName,
            ),
            Container(
              height: 4.0,
              width: double.infinity,
              color: Color(0xfff8f8f8),
            ),
            ListItem(
              name: '示例饿',
              type: 'fav',
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  ListItem({@required this.name, @required this.type, this.route});

  final String name; // 名称
  final String type; // icon
  final String route; // 跳转

  navigateTo(context) {
    Navigator.of(context).pushNamed('$route');
    // Navigator.push(
    //   context,
    //   PageRouteBuilder(
    //     pageBuilder: (
    //       BuildContext context,
    //       _,
    //       __,
    //     ) {
    //       return SliverBar();
    //     },
    //     transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
    //       return FadeTransition(
    //         opacity: animation,
    //         child: child,
    //       );
    //     },
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 42.0,
      child: InkWell(
        onTap: () {
          navigateTo(context);
        },
        child: Padding(
          padding:
              EdgeInsets.only(top: 12.0, bottom: 12.0, left: 20.0, right: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    height: 23.0,
                    width: 19.0,
                    child: Image.asset('assets/images/' + type + '_icon.png'),
                  ),
                  Text(
                    name,
                    style: TextStyle(fontSize: 16.0, color: Color(0xff3535335)),
                  ),
                ],
              ),
              Container(
                height: 11.0,
                width: 6.0,
                child: Image.asset('assets/images/arrow_right.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
