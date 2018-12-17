import 'package:flutter/material.dart';

import '../api/query.dart';
import '../api/apis.dart';
import 'package:dio/dio.dart';
import '../components/appBar.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _myClick() async {
    Dio _dio = DioFactory.getInstance().getDio();
    String url = Apis.baseUrl + Apis.login;
    Response response = await _dio.post(url, data: {"fakeId": 123456});
    print(response.data);
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
    );
  }
}
