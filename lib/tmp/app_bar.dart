import 'package:flutter/material.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter-demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.purple),
        ),
        primaryIconTheme: IconThemeData(color: Colors.blue),
        // brightness: Brightness.dark,
        backgroundColor: Colors.red,
        primaryColorBrightness: Brightness.dark,
        // accentColor: Color(0xff6ea6fd),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Center(
            child: Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.list), onPressed: () {})
          ],
          title: Text('Title'),
          // textTheme: TextTheme(
          //   title: TextStyle(
          //     color: Colors.white,
          //     fontSize: 18.0,
          //   ),
          // ),
          // backgroundColor: Colors.red,
          // brightness: Brightness.dark,
          elevation: 1.0,
        ),
        body: Center(
          child: MaterialButton(
            onPressed: () {},
            child: Text('button'),
          ),
        ),
      ),
    );
  }
}
