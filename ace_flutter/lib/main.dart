import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'common/resources/colors.dart';
import 'modules/store/store.dart';
import 'modules/client/client.dart';
import 'modules/mine/mine.dart';

/// Main
void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Main());
  // 沉浸式状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: MCColors.primary_color,
      ),
      home: Root(),
    );
  }
}

/// TabBarController
class Root extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootState();
  }
}

class _RootState extends State<Root> with SingleTickerProviderStateMixin {

  int _currentIndex = 0;
  PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MCColors.background_color,
        bottomNavigationBar: CupertinoTabBar(
          activeColor: MCColors.primary_color,
          currentIndex: _currentIndex,
          iconSize: 25,
          onTap: (int index) {
            if (mounted) {
              setState(() {
                _currentIndex = index;
                _controller.jumpToPage(index);
              });
            }
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/tabbar_store.png')),
                title: Text('店铺')),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/tabbar_user.png')),
                title: Text('用户')),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/tabbar_mine.png')),
                title: Text('我的')),
          ],
        ),
        body: body());
  }

  Widget body() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _controller,
      children: [
        new Store(),
        new Client(),
        new Mine(),
      ],
      onPageChanged: (int index) {
        if (mounted) {
          setState(() {
            _currentIndex = index;
          });
        }
      },
    );
  }
}
