import 'package:flutter/material.dart';
import '../../constants/common_constant.dart';
import '../../router/router.dart';

class BannerModel {
  String? title;
  FontStyle? style;
  MaterialColor? itemBackgroundColor;
  BannerModel({
    this.title,
    this.style,
    this.itemBackgroundColor,
  });
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

class TabItemModel {
  final String title;
  final IconData icon;
  TabItemModel(this.title, this.icon);
}

class TextModel {
  final String hintText;
  final TextStyle? hintStyle;
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? textScaleFactor;
  final TextOverflow? overflow;

  TextModel({
    required this.hintText,
    this.hintStyle,
    required this.text,
    this.style,
    this.maxLines,
    this.textAlign,
    this.textScaleFactor,
    this.overflow,
  });
}

class SingleScrollModel{
  final String title;
  final String router;
  SingleScrollModel(this.title, this.router);
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

  static List<SingleScrollModel> scrollItems = [
    SingleScrollModel('WidgetText', RouterUtil.routerWidgetText),
    SingleScrollModel('WidgetButton', RouterUtil.routerWidgetButton),
    SingleScrollModel('Checkbox Switch', RouterUtil.routerCheckboxSwitch),
    SingleScrollModel('TextField', RouterUtil.routerTextField),
  ];

  static GridViewConfig getDefaultConfig(BuildContext context) {
    return GridViewConfig(
      context: context,
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
      crossAxisCount: 4,
      childAspectRatio: 1,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 5.0,
      items: gridViewItems,
    );
  }

  static TextModel longTextModel() {
    return TextModel(
      hintText: '长文本显示(限制2行)',
      hintStyle: const TextStyle(fontSize: 18, color: Colors.pink),
      text:
          '文本的对齐方式；可以选择左对齐、右对齐还是居中。注意，对齐的参考系是Text widget 本身。本例中虽然是指定了居中对齐，但因为 Text 文本内容宽度不足一行，Text 的宽度和文本内容长度相等，那么这时指定对齐方式是没有意义的，只有 Text 宽度大于文本内容长度时指定此属性才有意义。',
      maxLines: 2,
      textScaleFactor: 1.0, //MediaQueryData.textScaleFactor 默认值
      overflow: TextOverflow.ellipsis, //显示...
    );
  }
}
