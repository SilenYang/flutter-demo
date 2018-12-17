import 'package:flutter/material.dart';

final pages = [
  new PageViewModel(
      const Color(0xFF678FB4),
      'assets/images/hotels.png',
      'Hotels',
      'All hotels and hostels are sorted by hospitality rating',
      'assets/images/key.png'),
  new PageViewModel(
      const Color(0xFF65B0B4),
      'assets/images/banks.png',
      'Banks',
      'We carefully verify all banks before adding them into the app',
      'assets/images/wallet.png'),
  new PageViewModel(
    const Color(0xFF9B90BC),
    'assets/images/stores.png',
    'Store',
    'All local stores are categorized for your convenience',
    'assets/images/shopping_cart.png',
  ),
];

class Page extends StatelessWidget {
  Page({this.pageViewModel, this.percentVisible = 1.0});
  final PageViewModel pageViewModel;
  final double percentVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: pageViewModel.color,
      child: Opacity(
        opacity: percentVisible,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 50.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  pageViewModel.heroAssetPath,
                  height: 200.0,
                  width: 200.0,
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 30.0 * (1.0 - percentVisible), 0.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Text(
                  pageViewModel.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "FlamanteRoma",
                      fontSize: 34.0),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(
                  0.0, 30.0 * (1.0 - percentVisible), 0.0),
              child: Text(
                pageViewModel.body,
                style:
                    TextStyle(color: Colors.white, fontFamily: "FlamanteRoma"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetIcon;

  PageViewModel(this.color, this.heroAssetPath, this.title, this.body,
      this.iconAssetIcon);
}
