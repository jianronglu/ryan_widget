import 'package:flutter/material.dart';
import 'package:widget01/home/view/home_banner_view.dart';
import 'package:widget01/home/model/home_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: HomeBannerView(
          items: HomeViewModel.bannerItems,
        ),
      ),
    );
  }
}
