import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../settings/settings.dart';

class Store extends StatefulWidget {
@override
  State<StatefulWidget> createState() {
    return _StoreState();
  }
}

class _StoreState extends State<Store> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ace商家版'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: onPressed),
        ],
      ),
      backgroundColor: Color(0xF5F5F5FF),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 头部
          header(),
          // 按钮
          menuItem(),
        ]
    ),
    );
  }

  Widget header() {
    Widget bgImage = Image(image: AssetImage('assets/images/store_header_bg.png'),
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
            Text(
              '当日成交金额（元）',
              style: TextStyle(
                  color: Colors.white
              ),
            ),

            Container(
            padding: EdgeInsets.only(top: 12, bottom: 23),
             child:  Text(
               '1234.00',
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 40,
               ),
             ),
           ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('浏览人数' + '\n' + '4567', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                Container(width: 0.5, height: 32, color: Colors.white),
                Text('付款订单数' + '\n' + '123', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),

              ],
            )

          ],
        ),
      ],
    );
  }

  Widget menuItem() {
    double width = MediaQuery.of(context).size.width/3;

    Widget menuLayout = Wrap(
      children: <Widget>[
        Container(
          color: Colors.white,
          height: width,
          width: width,
          child: MaterialButton(
            onPressed: menuOnPressed,
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
            onPressed: menuOnPressed,
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
            onPressed: menuOnPressed,
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
            onPressed: menuOnPressed,
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
            onPressed: menuOnPressed,
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

  void onPressed() {
  Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
    return new Settings();
  }));
  }

  void menuOnPressed() {
  }
}