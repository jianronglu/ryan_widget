import 'package:flutter/material.dart';
import '../home/model/home_view_model.dart';
import '../home/home_page.dart';
import '../trade/trade_page.dart';
import '../market/market_page.dart';
import '../widget/widget_scroll_page.dart';

class MainTabBarCtrl extends StatefulWidget {
  const MainTabBarCtrl({Key? key}) : super(key: key);

  @override
  State<MainTabBarCtrl> createState() => _MainTabBarCtrlState();
}

class _MainTabBarCtrlState extends State<MainTabBarCtrl> {
  int _currentPage = 0;

  final List<Widget> _pageList = [
    const HomePage(),
    const MarketPage(),
    const TradePage(),
    const WidgeKnowledge(),
  ];

  final List<TabItemModel> _items = [
    TabItemModel('首页', Icons.add),
    TabItemModel('行情', Icons.history),
    TabItemModel('交易', Icons.search_rounded),
    TabItemModel('组件', Icons.icecream),
  ];

  Widget createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentPage,
      iconSize: 30.0,
      fixedColor: Colors.red,
      onTap: (int page) {
        setState(() {
          _currentPage = page;
        });
      },
      type: BottomNavigationBarType.fixed,
      items: _items.map((data) {
        return BottomNavigationBarItem(
          icon: Icon(data.icon),
          label: data.title,
        );
      }).toList(),
    );
  }

  Widget createBody() {
    return _pageList[_currentPage];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createBody(),
      bottomNavigationBar: createBottomNavigationBar(),
    );
  }
}
