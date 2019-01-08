import 'package:flutter/material.dart';

class Client extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClientState();
  }
}

class _ClientState extends State<Client> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text('全部客户'),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.search), onPressed: searchOnPressed),
              ],
              bottom: tabBar(),
            ),
            body: tabBarView()
        ));
  }

  Widget tabBar() {
    return TabBar(
        tabs: <Widget> [
          Tab(text: '总交易额'),
          Tab(text: '最近购物'),
          Tab(text: '购物次数'),
        ]
    );
  }

  Widget tabBarView() {
    return TabBarView(
        children: <Widget> [
          listView(0),
          listView(1),
          listView(2),
        ]
    );
  }

  Widget listView(int type) {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
        return cell(type, index);
    });
  }

  Widget cell(int type, int index) {
    Row cell = Row(
      children: <Widget>[
        // 头像
        Material(
          color: Color(0xf5f5f5fF),
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              'https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo_top_86d58ae1.png',
              width: 50, height: 50
            ),
        ),

        Expanded(
            child:textView(type, index)
        ),
        
        Icon(Icons.keyboard_arrow_right)
      ],
    );
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(child: cell, padding: EdgeInsets.all(15)),
            Container(color: Color(0x6666666F), height: 0.5)
          ],
        ),
    );
  }

  Widget textView(int type, int index) {
    // 判断
    String title;
    String value;
    switch (type) {
      case 0: {
        title = '总交易额';
        value = '¥100.00';
        break;
      }
      case 1: {
        title = '最近交易于';
        value = '6月4日';
        break;
      }

      case 2: {
        title = '购买次数';
        value = '1次';
        break;
      }
    }
    // 生成
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('客户姓名', style: TextStyle(fontSize: 14)),
          Row(
            children: <Widget>[
              Text(title,
                style: TextStyle(fontSize: 16,
                  color: Color.fromRGBO(153, 153, 153, 1),
                ),
              ),
              Text(value,
                style: TextStyle(fontSize: 16,
                  color: Color.fromRGBO(233, 0, 0, 1),
                ),
              )
            ],
          )

        ],
      ),
    );
  }

  void searchOnPressed() {
  }
}