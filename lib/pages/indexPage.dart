import 'package:flutter/material.dart';

import '../components/appBar.dart';

class Index extends StatefulWidget {
  Index({Key key}) : super(key: key);

  @override
  createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: '首页',
      ).getAppBar(),
      body: Container(
        // color: Colors.white,
        child: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/page2");
            },
            child: Text("点我跳转"),
          ),
        ),
      ),
    );
  }
}
