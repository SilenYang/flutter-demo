import 'package:flutter/material.dart';
import '../components/appBar.dart';
import '../utils/screen.dart';

class List extends StatefulWidget {
  static const String routerName = 'list';

  @override
  State<StatefulWidget> createState() => _ListState();
}

class _ListState extends State<List> {
  ScrollController _controller = ScrollController();
  bool showBtn = false;
  final int judgeHeight = 500;
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
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
    final screenWidth = MediaQuery.of(context).size;
    double progressBarWidth = (screenWidth.width * _progress / 100).toDouble();
    return Scaffold(
      appBar: CustomAppBar(title: '滚动列表示例').getAppBar(),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              _progress = (progress * 100).toInt();
            });
          },
          child: Stack(
            children: <Widget>[
              ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${index + 1}"),
                    );
                  }),
              // progressBarWidth < 0 ? 0.0 : progressBarWidth
              Container(
                height: 2.0,
                alignment: Alignment.centerLeft,
                width: double.infinity,
                color: Colors.grey[200],
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: progressBarWidth < 0 ? 0.0 : progressBarWidth,
                      maxHeight: 1.0),
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: !showBtn
          ? null
          : FloatingActionButton(
              onPressed: () {
                _controller.animateTo(
                  .0,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
              },
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
