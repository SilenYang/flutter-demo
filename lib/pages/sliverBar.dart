import 'package:flutter/material.dart';
import '../components/appBar.dart';

class SliverBar extends StatefulWidget {
  static const String routeName = '/sliverBar';

  createState() => ScrollState();
}

class ScrollState extends State<SliverBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(
              title: 'sliverAppBar demo',
              backgroundImage: 'assets/images/autumn.jpeg',
              repeat: ImageRepeat.repeat,
              titleColor: Colors.pink,
              iconTheme: IconThemeData(
                color: Colors.pink,
              ),
              backgroundColor: Colors.blue,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) => <PopupMenuItem>[
                        const PopupMenuItem(
                          value: 'test1',
                          child: Text('test1'),
                        ),
                        const PopupMenuItem(
                          value: 'test2',
                          child: Text('test2'),
                        ),
                      ],
                  onSelected: (value) {},
                ),
              ],
              stackSpaceBars: <Widget>[
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, -0.4),
                      colors: <Color>[Color(0x60000000), Color(0x00000000)],
                    ),
                  ),
                ),
              ]).getSliverBar(),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
