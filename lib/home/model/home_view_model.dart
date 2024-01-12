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
}
