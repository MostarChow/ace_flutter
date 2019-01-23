import 'package:flutter/material.dart';
import '../../common/utils/config.dart';
import '../../common/resources/colors.dart';

class Mine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MineState();
  }
}

class _MineState extends State<Mine> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),

      body: body(),
    );
  }

  Widget body() {
    return Column(
        children: <Widget>[
          // 账户信息
          account(),
          // 企业信息
          enterprise(),
          // 联系人信息
          contact(),
        ],
      );
  }

  Widget account() {
    var view = Container(
      padding: EdgeInsets.all(18),
      width: Config.maxWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Wrap(
            spacing: 13,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Icon(Icons.info),
              Text('账户信息')
            ],
          ),
          Image.asset('assets/images/arrows_right_gray.png', height: 14,),
        ],
      ),
    );

    var button = Column(
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          color: Colors.white,
          padding: EdgeInsets.zero,
          child: view,
        ),
        Container(color: MCColors.line_color, height: 0.5,)
      ],
    );


    return Container(
      padding: EdgeInsets.only(bottom: 12),
      child: button,
    );
  }

  Widget enterprise() {
    var view = Container(
      padding: EdgeInsets.all(18),
      width: Config.maxWidth(context),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Wrap(
            spacing: 13,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Icon(Icons.business),
              Text('企业信息')
            ],
          ),
          Image.asset('assets/images/arrows_right_gray.png', height: 14,),
        ],
      ),
    );

    var button = FlatButton(
      onPressed: (){},
      color: Colors.white,
      padding: EdgeInsets.zero,
      child: view,
    );

    var line = Container(color: MCColors.line_color, height: 0.5,);

    return Column(
      children: <Widget>[
        line,
        button,
        line
      ],
    );
  }

  Widget contact() {
    var view = Container(
      padding: EdgeInsets.all(18),
      width: Config.maxWidth(context),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Wrap(
            spacing: 13,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Icon(Icons.contacts),
              Text('联系人信息')
            ],
          ),
          Image.asset('assets/images/arrows_right_gray.png', height: 14,),
        ],
      ),
    );

    var button = FlatButton(
      onPressed: (){},
      color: Colors.white,
      padding: EdgeInsets.zero,
      child: view,
    );

    return Column(
      children: <Widget>[
        button,
        Container(color: MCColors.line_color, height: 0.5,)
      ],
    );
  }


}