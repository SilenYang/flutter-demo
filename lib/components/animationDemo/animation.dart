import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimateNum extends StatefulWidget {
  static const String routeName = '/animatedNum';
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<AnimateNum>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double bottom = 0.0;
  double opacity = 1.0;

  static const duration = 500;

  dispose() {
    _controller.dispose();
    super.dispose();
  }

  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..addStatusListener((state) {
        // print(state);
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 500.0,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  BubbleAnimation(
                    controller: _controller,
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                _controller.forward(from: 0.0).orCancel;
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

class BubbleAnimation extends StatelessWidget {
  BubbleAnimation({Key key, this.controller}) : super(key: key) {
    _opacityIn = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.25, curve: Curves.linear),
    ));

    _scale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, .25, curve: Curves.elasticOut),
      ),
    );

    _bottom = Tween<double>(begin: 0.0, end: 50.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(.7, 1.0, curve: Curves.linear),
      ),
    );

    _opacityOut = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(.7, 1.0, curve: Curves.linear),
      ),
    );
  }

  final Animation<double> controller;
  Animation<double> _bottom;
  Animation<double> _opacityIn;
  Animation<double> _opacityOut;
  Animation<double> _scale;

  Widget _builder(BuildContext context, Widget child) {
    return AnimatedPositioned(
      bottom: 0.0,
      duration: Duration(milliseconds: 1000),
      child: ScaleTransition(
        scale: _scale,
        child: Opacity(
          opacity: _opacityOut.value,
          child: Opacity(
            opacity: _opacityIn.value,
            child: Container(
              width: 100.0,
              height: 50.0,
              margin: EdgeInsets.only(bottom: _bottom.value),
              child: Text(
                '+120',
                style: TextStyle(
                  fontSize: 40.0,
                  color: Color.fromRGBO(110, 166, 253, 1.0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _builder,
    );
  }
}
