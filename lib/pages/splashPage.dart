import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:async';
import 'dart:math';

import '../api/query.dart';
import '../api/apis.dart';
import 'package:dio/dio.dart';
import '../utils/timer_util.dart';
import 'homePage.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/splash';
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  TimerUtil _countDown;
  int status = 0;
  int _count = 4;

  List<String> _guideList = [
    'assets/images/guide1.jpg',
    'assets/images/guide2.jpg',
    'assets/images/guide3.jpg'
  ];

  String _ads = 'assets/images/ad.jpg';

  Future<int> _initNetData() async {
    Dio _dio = DioFactory.getInstance().getDio();
    String url = Apis.baseUrl + Apis.login;
    Response response = await _dio.post(url, data: {"fakeId": 123456});
    // print(response.data);
    return response.data;
  }

  List<Widget> _bannerList = <Widget>[];

  @override
  void initState() {
    super.initState();
    print('init splash');

    // mock network
    Future.delayed(Duration(seconds: 2)).then((_) {
      return 2;
      return Random().nextInt(2) + 1;
    }).then((_sta) {
      if (_sta == 1)
        _initGuide();
      else
        _initAds();
      setState(() {
        status = _sta;
      });
    });
  }

  void _initGuideData() {
    for (int i = 0, len = _guideList.length; i < len; i++) {
      _bannerList.add(Stack(
        children: <Widget>[
          Image.asset(
            _guideList[i],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            child: i == len - 1
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 160.0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.indigoAccent,
                        child: Text(
                          '立即体验',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        onPressed: () {
                          go2HomePage();
                        },
                      ),
                    ),
                  )
                : Center(),
          )
        ],
      ));
    }
  }

  void _initGuide() {
    _initGuideData();
    setState(() {
      status = 1;
    });
  }

  void _initAds() {
    countDown();
    setState(() {
      status = 2;
    });
  }

  // 倒计时
  void countDown() {
    _countDown = TimerUtil(totalTime: 4 * 1000);
    _countDown.setOnTimerTickCallback((int tick) {
      double _tick = tick / 1000;
      if (_tick <= 0) {
        go2HomePage();
      } else {
        setState(() {
          _count = _tick.toInt();
        });
      }
    });
    _countDown.startCountDown();
  }

  void go2HomePage() {
    Navigator.of(context).pushReplacementNamed('/home');
    // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(builder: (context) => Home()),
    //   (Route<dynamic> rout) => false,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Offstage(
            offstage: !(status == 0),
            child: Image.asset(
              "assets/images/splash.jpg",
              width: double.infinity,
              fit: BoxFit.fill,
              height: double.infinity,
            ),
          ),
          Offstage(
            offstage: !(status == 1),
            child: Swiper(
              itemCount: _bannerList.length,
              itemBuilder: (BuildContext context, int idx) {
                return _bannerList[idx];
              },
              pagination: SwiperPagination(
                  margin: EdgeInsets.only(bottom: 50.0),
                  builder: DotSwiperPaginationBuilder(
                    activeColor: Colors.blueAccent,
                    color: Colors.white,
                  )),
              loop: false,
            ),
          ),
          Offstage(
            offstage: !(status == 2),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    print('jump to ad');
                  },
                  child: Image.asset(
                    _ads,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  right: 30.0,
                  bottom: 50.0,
                  child: InkWell(
                    onTap: () {
                      go2HomePage();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      width: 64.0,
                      child: Text(
                        '跳过 $_count',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0x66000000),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        border: Border.all(
                          width: 0.33,
                          color: Color(0xffe5e5e5),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (_countDown != null) _countDown.cancel();
    super.dispose();
  }
}
