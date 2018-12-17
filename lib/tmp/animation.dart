import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ShowAdd extends AnimatedWidget {
  ShowAdd({Key key, Animation<double> animation, this.controller})
      : super(key: key, listenable: animation);

  final AnimationController controller;

  Widget build(BuildContext context) {
    // final Animation<double> animation = listenable;
    final Animation<double> _scale =
        Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, .25, curve: Curves.elasticOut),
      ),
    );
    final Animation<double> _fade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, .20, curve: Curves.linear),
      ),
    );
    return Center(
      child: FadeTransition(
        opacity: _fade,
        child: ScaleTransition(
          scale: _scale,
          child: Text(
            '+120',
            style: new TextStyle(
              fontSize: 40.0,
              color: new Color.fromRGBO(110, 166, 253, 1.0),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimateNum extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<AnimateNum>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _fadeAimation;
  double bottom = 0.0;
  double opacity = 1.0;
  bool forward = true;

  static const duration = 500;

  dispose() {
    _controller.dispose();
    super.dispose();
  }

  initState() {
    super.initState();
    _controller = new AnimationController(
      // lowerBound: 0.0,
      // upperBound: 4.0,
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..addStatusListener((state) {
        print(state);
      });

    // _fadeAimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //     parent: _controller, curve: Interval(0.0, 0.8, curve: Curves.linear)))
    _fadeAimation = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0.75, 1.0, curve: Curves.linear)))
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) print('state');
        // Future.delayed(Duration(milliseconds: duration * 4), () {
        //   setState(() {
        //     opacity = 0.0;
        //     bottom = 40.0;
        //     // 恢复动画
        //     Future.delayed(Duration(milliseconds: duration * 2), () {
        //       setState(() {
        //         opacity = 1.0;
        //         bottom = 0.0;
        //       });
        //       // _controller.reverse();
        //       // Future.delayed(Duration(milliseconds: duration * 2), () {
        //       // });
        //     });
        //   });
        // });
      });
  }

  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        // child: AnimatedLogo(animation: animation),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 500.0,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  // AnimatedBuilder(
                  //   animation: _controller,
                  //   child: ShowAdd(
                  //     animation: _fadeAimation,
                  //     controller: _controller,
                  //   ),
                  //   builder: (BuildContext content, Widget child) {
                  //     return Transform.translate(
                  //       offset: Offset(0.0, _controller.value * -10.0),
                  //       child: child,
                  //     );
                  //   },
                  // ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: duration * 2),
                    bottom: bottom,
                    // child: AnimatedOpacity(
                    child: FadeTransition(
                      opacity: _fadeAimation,
                      // duration: Duration(milliseconds: duration * 2),
                      child: ShowAdd(
                        animation: _fadeAimation,
                        controller: _controller,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                _controller.forward(from: 0.0);
              },
              color: Colors.blue,
              child: Text(
                'press',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
