import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../settings/settings.dart';
import 'dart:io';
import 'dart:convert';

class Store extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreState();
  }
}

class _StoreState extends State<Store> with AutomaticKeepAliveClientMixin {

  double _turnover = 0;
  int _visitors = 0;
  int _orders = 0;
  var _grids = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _grids = [
      {
        "text": "店铺管理",
        "icon": ImageIcon(
            AssetImage('assets/images/store_management.png'), size: 33)
      },
      {
        "text": "推广信息",
        "icon": ImageIcon(
            AssetImage('assets/images/store_popularize.png'), size: 33)
      },
      {
        "text": "数据统计",
        "icon": ImageIcon(
            AssetImage('assets/images/store_statistics.png'), size: 33)
      },
      {
        "text": "订单管理",
        "icon": ImageIcon(AssetImage('assets/images/store_order.png'), size: 33)
      },
      {
        "text": "退换售后",
        "icon": ImageIcon(
            AssetImage('assets/images/store_after-sales.png'), size: 33)
      },
      {} // 空白
    ];

    getData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Ace商家版'),
          actions: <Widget>[
            // 设置
            IconButton(icon: Icon(Icons.settings), onPressed: () {
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) {
                    return new Settings();
                  }));
            }),
          ],
        ),
        backgroundColor: Color(0xF5F5F5FF),

        body: body()
    );
  }

  @override
  bool get wantKeepAlive => true;

  getData() async {
    String host = 'https://www.easy-mock.com/mock/5c3590153df7227eb0a9d485/acestore';
    String method = '/today';

    var data;

    var http = new HttpClient();
    var url = Uri.parse(host + method);
    var request = await http.postUrl(url);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    print('开始请求');
    if (response.statusCode == 200) {
      print('请求成功');
      Map responseJson = json.decode(responseBody);
      data = responseJson['data'];
    } else {
      print('请求失败:' + url.toString() + '\n' + responseBody);
    }

    setState(() {
      _turnover = data['turnover'];
      _visitors = data['visitors'];
      _orders = data['orders'];
    });
  }

  Widget body() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 头部
          header(),
          // 按钮
          Expanded(flex: 1, child: grid()),
        ]
    );
  }

  Widget header() {
    Widget bgImage = Image.asset('assets/images/store_header_bg.png',
      height: 202,
    );

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        bgImage,

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('当日成交金额（元）', style: TextStyle(color: Colors.white),
            ),

            Container(
              padding: EdgeInsets.only(top: 12, bottom: 23),
              child: Text(_turnover.toStringAsFixed(2),
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('浏览人数' + '\n' + _visitors.toString(),
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,),
                Container(width: 0.5, height: 32, color: Colors.white),
                Text('付款订单数' + '\n' + _orders.toString(),
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,),

              ],
            )

          ],
        ),
      ],
    );
  }

  Widget grid() {
    var grid = GridView.count(
      padding: EdgeInsets.only(top: 11),
      physics: BouncingScrollPhysics(),
      crossAxisCount: 3,
      children: <Widget>[
        item(0), item(1), item(2), item(3), item(4), item(5)
      ],
    );
    return grid;
  }

  Widget item(int index) {
    var title = _grids[index]['text'];
    var icon = _grids[index]['icon'];

    if (index+1 < _grids.length) {
      return Container(
        color: Colors.white,
        child: MaterialButton(
          onPressed: () {
            print(title);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: icon,
                padding: EdgeInsets.all(14),
              ),
              Text(title)
            ],
          ),
        ),
      );
    } else {
      return Container(color: Colors.white);
    }
  }
}