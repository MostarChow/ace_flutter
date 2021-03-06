import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../common/resources/colors.dart';
import '../../common/utils/networking.dart';
import 'detail.dart';


class TotalSales extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TotalSalesState();
  }
}

class _TotalSalesState extends State<TotalSales> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  var _clients = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Networking().request(context, '/client/type=0', (data) {
      if (mounted) {
        setState(() {
          var list = data['list'];
          _clients = list;
        });
      }
    }, (error){

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listView(),
    );
  }

  Widget listView() {
    return ListView.builder(
        itemCount: _clients.length,
        itemBuilder: (BuildContext context, int index){
        return cell(index);
    });
  }

  Widget cell(int index) {

    var imageUrl = _clients[index]['imageUrl'];

    Widget view = Row(
      children: <Widget>[
        // 头像
        ClipOval(
          child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.fill, width: 50, height: 50),
        ),
        // 文字
        Expanded(child:textView(index)),
        // 箭头
        Image.asset('assets/images/arrows_right_gray.png', height: 14,),
      ],
    );
    Widget contentView = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(child: view, padding: EdgeInsets.all(15)),
          Container(color: MCColors.line_color, height: 0.5)
        ],
      ),
    );

    return FlatButton(
      onPressed: () {
        Navigator.push(context, new CupertinoPageRoute(builder: (context) {
          // 点击
          return Detail();
        }));
      },
      child: contentView,
      padding: EdgeInsets.all(0),
      color: Colors.white,
    );
  }

  Widget textView(int index) {

    var name = _clients[index]['username'];
    double totalSales = _clients[index]['totalSales'];

    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name, style: TextStyle(fontSize: 14)),
          Row(
            children: <Widget>[
              Text('总交易额',
                style: TextStyle(fontSize: 16,
                  color: MCColors.primary_color,
                ),
              ),
              Text('¥'+totalSales.toStringAsFixed(2),
                style: TextStyle(fontSize: 16,
                  color: MCColors.money_color,
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}