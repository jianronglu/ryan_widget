import 'package:flutter/material.dart';
import 'package:widget01/home/view/home_grid_view.dart';
import '../home/view/home_banner_view.dart';
import '../home/model/home_view_model.dart';
import '../../../constants/common_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _createBannerView() {
    return const SizedBox(
      height: NumberConstant.bannerHeight,
      child: HomeBannerView(
        items: HomeViewModel.bannerItems,
      ),
    );
  }

  Widget _createGridView() {
    return SizedBox(
      height: NumberConstant.homePageCridViewHeight,
      child: HomeGridView(items: HomeViewModel.gridViewItems),
    );
  }

  Widget _createBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _createBannerView(),
        _createGridView(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
      ),
      body: _createBody(),
    );
  }
}
