import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'store/store.dart';
import 'client/client.dart';
import 'mine/mine.dart';

/// Main

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(Main());
}

class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Index(),
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
      ),
    );
  }
}

/// TabBarController
class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<Index> {
  int _selectedIndex = 0;
  var _store = new Store();
  var _client = new Client();
  var _mine = new Mine();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF5F5F5FF),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/tabbar_store.png')), title: Text('店铺')),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/tabbar_user.png')), title: Text('用户')),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/tabbar_mine.png')), title: Text('我的')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.black,
        onTap: _onTap,
      ),
      body: _onTapIndex(),
    );
  }

  void _onTap(int index) {
  setState(() {
    _selectedIndex = index;
  });
  }

  Widget _onTapIndex() {
    switch (_selectedIndex) {
      case 0: {
        return _store;
      }
      case 1: {
        return _client;
      }
      case 2: {
        return _mine;
      }
    }
    return null;
  }
}