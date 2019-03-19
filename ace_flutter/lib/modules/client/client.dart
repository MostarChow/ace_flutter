import 'package:flutter/material.dart';
import '../../common/resources/colors.dart';
import 'total_sales.dart';
import 'recent_shopping.dart';
import 'shopping_times.dart';

class Client extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClientState();
  }
}

class _ClientState extends State<Client> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  var _viewControllers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewControllers = [
      new TotalSales(),
      new RecentShopping(),
      new ShoppingTimes()
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text('全部客户'),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: (){
                      debugPrint('点击搜索');
                    }),
              ],
              bottom: tabBar(),
            ),
            body: tabBarView()
        ));
  }

  Widget tabBar() {
    return TabBar(
        indicatorColor: MCColors.primary_color,
        tabs: <Widget> [
          Tab(text: '总交易额'),
          Tab(text: '最近购物'),
          Tab(text: '购物次数'),
        ]
    );
  }

  Widget tabBarView() {
    return TabBarView(children: _viewControllers);
  }

}