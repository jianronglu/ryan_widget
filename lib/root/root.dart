import 'package:flutter/material.dart';
import 'package:widget01/home/home_page.dart';
import 'package:widget01/trade/trade_page.dart';
import 'package:widget01/market/market_page.dart';

class SGZQ extends StatelessWidget {
  const SGZQ({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Widget> bodyPages = [
      const HomePage(),
      const MarketPage(),
      const TradePage(),
    ];

    return MaterialApp(
      title: '申港',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: bodyPages.length,
        child: Scaffold(
          body: TabBarView(// 页面内容
            children: bodyPages,
          ),
          bottomNavigationBar: const TabBar(// 底部导航
            tabs: [
              Tab(text: '首页',),
              Tab(text: '行情',),
              Tab(text: '交易',),
            ],
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
          ),

        ),
      ),
    );
  }
}

