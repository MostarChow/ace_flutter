import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'store/store.dart';
import 'client/client.dart';
import 'mine/mine.dart';

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

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  var _viewControllers = [
    new Store(),
    new Client(),
    new Mine(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xF5F5F5FF),
        bottomNavigationBar: CupertinoTabBar(
          iconSize: 25,
          activeColor: Colors.black,
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
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: body()
    );
  }


  Widget body() {
    return Scaffold(
      body: _viewControllers[_selectedIndex],
    );
  }
}
