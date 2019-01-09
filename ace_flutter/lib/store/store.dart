import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../settings/settings.dart';
import 'dart:io';
import 'dart:convert';

class Store extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StoreState();
  }
}

class StoreState extends State<Store> with AutomaticKeepAliveClientMixin {

  double _turnover = 0;
  int _visitors = 0;
  int _orders = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('初始化了');
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ace商家版'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: (){
            Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
              return new Settings();
            }));
          }),
        ],
      ),
      backgroundColor: Color(0xF5F5F5FF),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 头部
          _header(),
          // 按钮
          _menuItem(),
        ]
    ),
    );
  }

  _getData() async {
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

  Widget _header() {
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
             child:  Text(_turnover.toStringAsFixed(2), style: TextStyle(color: Colors.white, fontSize: 40),
             ),
           ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('浏览人数' + '\n' + _visitors.toString(), style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                Container(width: 0.5, height: 32, color: Colors.white),
                Text('付款订单数' + '\n' + _orders.toString(), style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),

              ],
            )

          ],
        ),
      ],
    );
  }

  Widget _menuItem() {
    double width = MediaQuery.of(context).size.width/3;

    Widget menuLayout = Wrap(
      children: <Widget>[
        Container(
          color: Colors.white,
          height: width,
          width: width,
          child: MaterialButton(
            onPressed: (){
              print('店铺管理');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: ImageIcon(AssetImage('assets/images/store_management.png'),size: 33),
                  padding: EdgeInsets.all(14),
                ),
                Text('店铺管理')
              ],
            ),
          ),
        ),
        Container(
          color: Colors.white,
          height: width,
          width: width,
          child: MaterialButton(
            onPressed: (){
              print('推广信息');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: ImageIcon(AssetImage('assets/images/store_popularize.png'),size: 33),
                  padding: EdgeInsets.all(14),
                ),
                Text('推广信息')
              ],
            ),
          ),
        ),
        Container(
          color: Colors.white,
          height: width,
          width: width,
          child: MaterialButton(
            onPressed: (){
              print('数据统计');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: ImageIcon(AssetImage('assets/images/store_statistics.png'),size: 33),
                  padding: EdgeInsets.all(14),
                ),
                Text('数据统计')
              ],
            ),
          ),
        ),
        Container(
          color: Colors.white,
          height: width,
          width: width,
          child: MaterialButton(
            onPressed: (){
              print('订单管理');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: ImageIcon(AssetImage('assets/images/store_order.png'),size: 33),
                  padding: EdgeInsets.all(14),
                ),
                Text('订单管理')
              ],
            ),
          ),
        ),
        Container(
          color: Colors.white,
          height: width,
          width: width,
          child: MaterialButton(
            onPressed: (){
              print('退换售后');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: ImageIcon(AssetImage('assets/images/store_after-sales.png'),size: 33),
                  padding: EdgeInsets.all(14),
                ),
                Text('退换售后')
              ],
            ),
          ),
        ),
        Container(
          color: Colors.white,
          height: width,
          width: width,
        ),
      ],
    );
    return Container(
      padding: EdgeInsets.only(top: 11),
      child: menuLayout,
    );
  }

  @override
  bool get wantKeepAlive => true;
}