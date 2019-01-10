import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'detail.dart';

class ShoppingTimes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShoppingTimesState();
  }
}

class _ShoppingTimesState extends State<ShoppingTimes> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  var _clients = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: listView(),
    );
  }

  getData() async {
    String host = 'https://www.easy-mock.com/mock/5c3590153df7227eb0a9d485/acestore';
    String method = '/client/type=2';

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
      var list = data['list'];
      _clients = list;
    });
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
          child: Image.network(imageUrl, fit: BoxFit.fill, width: 50, height: 50),
        ),
        // 文字
        Expanded(child:textView(index)),
        // 箭头
        Icon(Icons.keyboard_arrow_right)
      ],
    );
    Widget contentView = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(child: view, padding: EdgeInsets.all(15)),
          Container(color: Color(0x6666666F), height: 0.5)
        ],
      ),
    );

    return MaterialButton(
      onPressed: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
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
    int frequency = _clients[index]['frequency'];

    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name, style: TextStyle(fontSize: 14)),
          Row(
            children: <Widget>[
              Text('购买次数',
                style: TextStyle(fontSize: 16,
                  color: Color.fromRGBO(153, 153, 153, 1),
                ),
              ),
              Text(frequency.toString()+'次',
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
}