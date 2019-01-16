import 'package:flutter/material.dart';
import '../components/appBar.dart';

class SliverBar extends StatefulWidget {
  static const String routeName = '/sliverBar';

  createState() => ScrollState();
}

class ScrollState extends State<SliverBar> {
  ScrollController _controller = ScrollController();
  bool showBtn = false;
  final int judgeHeight = 500;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < judgeHeight && showBtn) {
        setState(() {
          showBtn = false;
        });
      } else if (_controller.offset >= judgeHeight && !showBtn) {
        setState(() {
          showBtn = true;
        });
      }
    });
  }

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
          ListView.builder(
            controller: _controller,
            itemCount: 30,
            itemExtent: 50.0,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${index + 1}'),
              );
            },
          ),
        ],
      ),
      floatingActionButton: !showBtn
          ? null
          : FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
