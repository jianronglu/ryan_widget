import 'package:flutter/material.dart';
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
    return SizedBox(
      height: NumberConstant.bannerHeight,
      child: HomeBannerView(
        items: HomeViewModel.bannerItems,
      ),
    );
  }

  Widget _createGridItem(int index) {
    return Container(
      color: Colors.red,
      margin: const EdgeInsets.all(NumberConstant.gridViewMargin),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                print('click $index');
              },
              icon: Icon(Icons.add)),
          Expanded(
            child: Text(
              HomeViewModel.bannerItems[index],
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createGridView() {
    return Container(
      height: NumberConstant.homePageCridViewHeight,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),//禁止弹动
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: NumberConstant.homePageGridViewDelegateItemCount),
          itemCount: HomeViewModel.bannerItems.length,
          itemBuilder: (BuildContext content, int index) =>
              _createGridItem(index)),
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
