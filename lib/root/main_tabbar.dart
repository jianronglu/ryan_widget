import 'package:flutter/material.dart';
import '../root/main_tabbar_model.dart';
import '../home/home_page.dart';
import '../trade/trade_page.dart';
import '../market/market_page.dart';

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
  ];

  final List<MainItemModel> _items = [
    MainItemModel('首页', Icons.add),
    MainItemModel('行情', Icons.history),
    MainItemModel('交易', Icons.search_rounded),
  ];

  Widget createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentPage,
      iconSize: 30.0,
      fixedColor: Colors.red,

      onTap: (int page){
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



