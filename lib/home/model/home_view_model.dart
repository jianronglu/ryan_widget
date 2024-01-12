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
    GridViewItemModel('一键打新', ImageConstant.image_yjdx),
    GridViewItemModel('极速开户', ImageConstant.image_jskh),
    GridViewItemModel('投资日历', ImageConstant.image_tzrl),
    GridViewItemModel('量化选股', ImageConstant.image_lhxg),
    GridViewItemModel('策略诊股', ImageConstant.image_clzg),
    GridViewItemModel('收益凭证', ImageConstant.image_sypz),
    GridViewItemModel('高端理财', ImageConstant.image_gdlc),
    GridViewItemModel('投顾签约', ImageConstant.image_tgqy),
  ];
}
