import 'package:flutter/material.dart';
import '../home/view/home_banner_view.dart';
import '../home/model/home_view_model.dart';

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
        title: const Text('首页'),
      ),
      body: const Center(
        child: HomeBannerView(
          items: HomeViewModel.bannerItems,
        ),
      ),
    );
  }
}
