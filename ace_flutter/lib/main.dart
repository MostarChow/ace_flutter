import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'sources/modules/store/store.dart';
import 'sources/modules/client/client.dart';
import 'sources/modules/mine/mine.dart';

/// Main

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Root(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.black,
      ),
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
  int _currentIndex;
  PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = 0;
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xF5F5F5FF),
        bottomNavigationBar: CupertinoTabBar(
          activeColor: Colors.black,
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
