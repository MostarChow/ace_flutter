import 'package:flutter/material.dart';

class ClientDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClientDetailState();
  }
}

class _ClientDetailState extends State<ClientDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text('客户详情'),
      ),
      body: body(),
    );
  }

  Widget body() {
    Widget body = Column(
      children: <Widget>[
        // 头部
        header(),
        // 菜单

      ],
    );

    return  body;
  }

  Widget header() {
    Widget headerView  = Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        // 背景
        Image.asset('assets/images/client_header_bg.png',
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
            height: 187,
        ),
        // 内容
        headerContentView(),

      ],
    );
    return headerView;
  }

  Widget headerContentView() {
    return Container(
      padding: EdgeInsets.all(10),
      child: headerContentCardView(),
    );
  }

  Widget headerContentCardView() {
    return Container(
      color: Colors.white,
      width: 380,
      height: 137,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // 用户信息
          Expanded(child: headerContentCardInfoView(), flex: 1,),
          // logo
          Image.asset('assets/images/client_spade.png', height: 137)
        ],
      ),
    );
  }

  Widget headerContentCardInfoView() {
    Widget info = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // 头像，名字，标签
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 9,
          children: <Widget>[
            // 头像
            Material(
              color: Color(0xf5f5f5fF),
              borderRadius: BorderRadius.circular(30.5),
              child: Image.network(
                  'https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo_top_86d58ae1.png',
                  width: 61, height: 61
              ),
            ),

            Wrap(
              direction: Axis.vertical,
              children: <Widget>[
                // 名字
                Text('买家名', style: TextStyle(fontSize: 14)),
                // 标签
                Container(
                  padding: EdgeInsets.all(6),
                  color: Colors.black,
                  child: Text('V1小白生活家', style: TextStyle(fontSize: 9, color: Colors.white),),
                )
              ],
            )

          ],
        ),

        // 标签
        Expanded(
          flex: 1,
            child: Row(
              children: <Widget>[
                // 按钮
               Container(
                 padding: EdgeInsets.only(right: 9),
                 child:  MaterialButton(
                   height: 20,
                   minWidth: 60,
                   padding: EdgeInsets.zero,
                   onPressed: (){
                     print('添加标签');
                   },
                   child: Image(image: AssetImage('assets/images/client_add_tag_small.png'), height: 20),
                 ),
               ),

                // 标签
                Expanded(
                    child: Text('标签',
                      style: TextStyle(fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis,)
                ),
              ],
            )
        )

      ],
    );

    return Container(
      padding: EdgeInsets.only(top: 9, left: 7, bottom: 0, right: 7),
      child: info,
    );
  }
  
}
