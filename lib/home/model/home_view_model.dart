
import 'package:flutter/material.dart';
import '../../constants/common_constant.dart';

class BannerModel {
  String? title;
  FontStyle? style;
  MaterialColor? itemBackgroundColor;
}

class GridViewItemModel {
  String? title;
  String? iconName;
  GridViewItemModel(this.title, this.iconName);
}

class GridViewConfig {
  BuildContext context;
  final int crossAxisCount;
  final EdgeInsets? margin;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio; //宽高比
  final List<GridViewItemModel> items;

  GridViewConfig({
    required this.context,
    this.crossAxisSpacing = 0,
    this.mainAxisSpacing = 0,
    this.childAspectRatio = 1,
    this.crossAxisCount = 1,
    this.margin = EdgeInsets.zero,
    required this.items,
  });

  double getItemWith() {
    return (MediaQuery.of(context).size.width - margin!.left - margin!.right) /
        crossAxisCount;
  }
  double getViewHeight() {
    return getItemWith() * 2;
  }
}

class HomeViewModel {
  static const List<String> bannerItems = [
    'Apple',
    'Banana',
    'Cherry',
    'Grape',
    'Orange',
    'Pineapple',
    'Strawberry',
    'Watermelon',
    'Kiwi fruit',
    'Blueberry',
  ];

  static List<GridViewItemModel> gridViewItems = [
    GridViewItemModel('一键打新', ImageConstant.yjdx),
    GridViewItemModel('极速开户', ImageConstant.jskh),
    GridViewItemModel('投资日历', ImageConstant.tzrl),
    GridViewItemModel('量化选股', ImageConstant.lhxg),
    GridViewItemModel('策略诊股', ImageConstant.clzg),
    GridViewItemModel('收益凭证', ImageConstant.sypz),
    GridViewItemModel('高端理财', ImageConstant.gdlc),
    GridViewItemModel('投顾签约', ImageConstant.tgqy),
  ];

  static getDefaultConfig(BuildContext context) {
    return GridViewConfig(
      context: context,
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      crossAxisCount: 4,
      childAspectRatio: 1,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      items: gridViewItems,
    );
  }
}
