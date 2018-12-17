import 'dart:async';
import 'package:flutter/material.dart';
import '../components/animate/dragger.dart';
import '../components/animate/indicator.dart';
import '../components/animate/pages.dart';
import '../components/animate/reveal.dart';
import '../components/appBar.dart';

class AnimatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PageState();
  }
}

class PageState extends State<AnimatePage> with TickerProviderStateMixin {
  AnimatedPageDragger animatedPageDragger;
  StreamController<SlideUpdate> streamController;

  int activeIndex = 0;
  int nextIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;

  PageState() {
    streamController = StreamController();
    streamController.stream.listen((SlideUpdate event) {
      setState(() {
        if (event.updateType == UpdateType.dragging ||
            event.updateType == UpdateType.animation) {
          slideDirection = event.slideDirection;
          slidePercent = event.slidePercent;
          if (slideDirection == SlideDirection.LeftToRight) {
            nextIndex = activeIndex - 1;
          } else if (slideDirection == SlideDirection.RightToLeft) {
            nextIndex = activeIndex + 1;
          } else {
            nextIndex = activeIndex;
          }
        } else if (event.updateType == UpdateType.doneDragging) {
          var transitionGoal;
          if (slidePercent > 0.5) {
            transitionGoal = TransitionGoal.open;
          } else {
            transitionGoal = TransitionGoal.close;
          }
          animatedPageDragger = AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: transitionGoal,
              slidePercent: slidePercent,
              slideUpdateStream: streamController,
              vsync: this);
          animatedPageDragger.run();
        } else if (event.updateType == UpdateType.doneAnimation) {
          activeIndex = nextIndex;
          slidePercent = 0.0;
          slideDirection = SlideDirection.none;
          animatedPageDragger.dispose();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: '滑动动画',
        backgroundColor: pages[activeIndex].color,
        brightness: false,
      ).getAppBar(),
      body: Stack(
        children: <Widget>[
          Page(
            pageViewModel: pages[activeIndex],
            percentVisible: 1.0,
          ),
          PageReveal(
            revealPercent: slidePercent,
            child: Page(
              pageViewModel: pages[nextIndex],
              percentVisible: slidePercent,
            ),
          ),
          PageIndicator(
            pageIndicatorViewModel: PageIndicatorViewModel(
              pages,
              activeIndex,
              slideDirection,
              slidePercent,
            ),
            controllContent: PageDragger(
              canDragToLeft: activeIndex < pages.length - 1,
              canDragToRight: activeIndex > 0,
              streamController: streamController,
            ),
          ),
        ],
      ),
    );
  }
}
