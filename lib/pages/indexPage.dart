import 'package:flutter/material.dart';

import '../components/appBar.dart';
import '../api/query.dart';
import '../api/apis.dart';
import 'package:dio/dio.dart';

class Index extends StatefulWidget {
  Index({Key key}) : super(key: key);

  @override
  createState() => _IndexState();
}

class _IndexState extends State<Index> {
  Future<Null> _init() async {
    Dio _fetch = Fetch().getDio();
    Dio _dio = Fetch().getDio();
    print(identical(_fetch, _dio));
    // String url = Apis.baseUrl + Apis.login;
    // Response response = await _fetch.post(url, data: {"fakeId": 123456});
    // print(response.data);
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _init();
        },
        child: Icon(
          Icons.favorite,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
