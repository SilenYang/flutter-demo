import 'package:flutter/material.dart';
import '../components/appBar.dart';

class SliverBar extends StatelessWidget {
  static const String routeName = '/sliverBar';

  @override
  Widget build(BuildContext context) {
    Widget _itemBuilder(BuildContext content, int index) {
      return ListTile(
        leading: Icon(Icons.mail_outline),
        title: Text('data${index}'),
      );
    }

    List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
      // return <Widget>[];
      return <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          child: CustomAppBar(
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
        ),
      ];
    }

    return Scaffold(
      appBar: null,
      body: NestedScrollView(
        headerSliverBuilder: _sliverBuilder,
        body: Container(
          child: ListView.builder(
            itemBuilder: _itemBuilder,
            itemCount: 15,
          ),
        ),
      ),
    );
  }
}
