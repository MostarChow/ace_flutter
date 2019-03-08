import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../common/resources/colors.dart';
import '../../common/utils/networking.dart';
import '../settings/settings.dart';

class Store extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StoreState();
  }
}

class _StoreState extends State<Store> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  double _turnover = 0;
  int _visitors = 0;
  int _orders = 0;
  var _grids = [
    {
      "text": "店铺管理",
      "icon": ImageIcon(AssetImage('assets/images/store_management.png'), size: 33)
    },
    {
      "text": "推广信息",
      "icon": ImageIcon(AssetImage('assets/images/store_popularize.png'), size: 33)
    },
    {
      "text": "数据统计",
      "icon": ImageIcon(AssetImage('assets/images/store_statistics.png'), size: 33)
    },
    {
      "text": "订单管理",
      "icon": ImageIcon(AssetImage('assets/images/store_order.png'), size: 33)
    },
    {
      "text": "退换售后",
      "icon": ImageIcon(AssetImage('assets/images/store_after-sales.png'), size: 33)
    },
    {} // 空白
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Networking().request('/today', (data){
      if (mounted) {
        setState(() {
          _turnover = data['turnover'];
          _visitors = data['visitors'];
          _orders = data['orders'];
        });
      }
    }, (error){
      print(error);
    });
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
                  new CupertinoPageRoute(builder: (context) {
                    return new Settings();
                  }));
            }),
          ],
        ),
        backgroundColor: MCColors.background_color,

        body: body()
    );
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