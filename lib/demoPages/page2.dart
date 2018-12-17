import 'package:flutter/material.dart';

// page2.dart
class Page2 extends StatelessWidget {
  static const String routeName = '/page2';

  Page2(this.content);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
      ),
      body: Center(
        child: Text(content),
      ),
    );
  }
}
