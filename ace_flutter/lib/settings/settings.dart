import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  // 数据
  List<String> _texts = ['关于我们', '隐私政策', '检查更新', '版本'];

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
        itemCount: _texts.length,
        itemBuilder: (BuildContext context, int index) {
          return cell(index);
        }
      ),
    );
  }

  Widget cell(int index) {
    return MaterialButton(
      onPressed: () {
        print(index.toString());
      },
      child: contentView(index),
      padding: EdgeInsets.zero,
      color: Colors.white,
    );
  }

  Widget contentView(int index) {
    String text = _texts[index];
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(text, style: TextStyle(fontSize: 16),),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),

          Container(
            color: Color(0x6666666F),
            height: 0.5,
          )

        ],
      )

    );
  }
}