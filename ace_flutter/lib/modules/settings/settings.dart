import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../common/resources/colors.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  // 数据
  var _menus = [
    {"title": "关于我们", "type": 0},
    {"title": "隐私政策", "type": 0},
    {"title": "检查更新", "type": 0},
    {"title": "版本", "type": 1}
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: ListView.builder(
          itemCount: _menus.length,
          itemBuilder: (BuildContext context, int index) {
            return cell(index);
          }),
    );
  }

  Widget cell(int index) {
    int type = _menus[index]['type'];
    // 点击事件
    var onPressed;
    if (type == 0) {
      onPressed = () {
        debugPrint(index.toString());
      };
    }
    return FlatButton(
      onPressed: onPressed,
      child: contentView(index),
      padding: EdgeInsets.zero,
      color: Colors.white,
      disabledColor: Colors.white,
      textColor: MCColors.primary_color,
      disabledTextColor: MCColors.primary_color,
    );
  }

  Widget contentView(int index) {
    String title = _menus[index]['title'];
    int type = _menus[index]['type'];

    var children = List<Widget>();
    if (type == 0) {
      children.add(Text(title, style: TextStyle(fontSize: 16)));
      children.add(Image.asset('assets/images/arrows_right_gray.png', height: 14,),);
    } else {
      children.add(Text(title + 'V1.0', style: TextStyle(fontSize: 16)));
    }

    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: children,
          ),
        ),
        Container(
          color: MCColors.line_color,
          height: 0.5,
        )
      ],
    ));
  }
}
