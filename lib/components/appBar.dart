import 'package:flutter/material.dart';

const List<Widget> defaultStackSpaceBars = <Widget>[];

class CustomAppBar {
  CustomAppBar({
    this.context,
    @required this.title,
    this.backgroundColor,
    this.brightness = true,
    this.titleColor,
    this.backgroundImage,
    this.repeat = ImageRepeat.noRepeat,
    this.actions,
    this.leading,
    this.iconTheme,
    this.expandedHeight = 200,
    this.centerTitle = true,
    this.stackSpaceBars = defaultStackSpaceBars,
  });

  final String title;
  final BuildContext context;
  final Color backgroundColor;
  final bool brightness;
  dynamic titleColor;
  final String backgroundImage;
  final ImageRepeat repeat;
  final List<Widget> actions;
  final Widget leading;
  final IconThemeData iconTheme;
  final double expandedHeight;
  final bool centerTitle;
  final List<Widget> stackSpaceBars;

  getAppBar() {
    dynamic titleTrueColor;
    titleTrueColor = titleColor != null
        ? titleColor
        : brightness ? Colors.black : Colors.white;

    return AppBar(
      title: Text(title),
      elevation: 0.0,
      textTheme: TextTheme(
        title: TextStyle(
          color: titleTrueColor,
          fontSize: 18.0,
        ),
      ),
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
      backgroundColor: backgroundColor,
    );
  }

  getSliverBar() {
    dynamic titleTrueColor;
    titleTrueColor = titleColor != null
        ? titleColor
        : brightness ? Colors.black : Colors.white;

    List<Widget> stackSpace = <Widget>[];
    stackSpace.add(Image.asset(
      backgroundImage,
      repeat: repeat,
    ));

    stackSpace.addAll(stackSpaceBars);

    return SliverAppBar(
      iconTheme: iconTheme,
      brightness: brightness ? Brightness.light : Brightness.dark,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      expandedHeight: expandedHeight,
      floating: false,
      pinned: true,
      leading: leading,
      actions: actions,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: centerTitle,
        title: Text(
          title,
          style: TextStyle(color: titleTrueColor),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: stackSpace.toList(),
        ),
      ),
    );
  }
}
