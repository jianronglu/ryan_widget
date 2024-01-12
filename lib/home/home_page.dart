import 'package:flutter/material.dart';
import '../home/view/home_grid_view.dart';
import '../home/view/home_list_view.dart';
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
    final _crossAxisCount = 4;
    final _margin  = EdgeInsets.fromLTRB(15, 2, 15, 2);
    final _itemWith = (MediaQuery.of(context).size.width - _margin.left - _margin.right) / _crossAxisCount;
    final _spacing = 5.0;
    final _ratio = 1.0;
    return SizedBox(
      height: _itemWith * 2,
      child: HomeGridView(
        items: HomeViewModel.gridViewItems,
        crossAxisCount: _crossAxisCount,
        mainAxisSpacing: _spacing,
        crossAxisSpacing: _spacing,
        childAspectRatio: _ratio,
        margin: _margin,
      ),
    );
  }

 Widget _createListView() {
    return HomeNewsList(items: HomeViewModel.bannerItems);
 }

  Widget _createBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _createBannerView(),
        _createGridView(),
        Expanded(child: _createListView()),
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
