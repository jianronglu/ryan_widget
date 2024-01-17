import 'package:flutter/material.dart';
import '../widget/chore/widget_text_field.dart';
import '../root/main_tab_bar.dart';
import '../market/market_page.dart';
import '../trade/trade_page.dart';
import '../widget/chore/widget_text.dart';
import '../widget/chore/widget_button.dart';
import '../widget/widget_scroll_page.dart';
import '../widget/chore/widget_checkbox_switch.dart';

class RouterUtil {
  static const String routerMainTab = '/';
  static const String routerMarket = '/market';
  static const String routerTrade = '/trade';
  static const String routerWidgetText = '/widgetText';
  static const String routerWidgetButton = '/widgetButton';
  static const String routerSingleScroll = '/singleScroll';
  static const String routerCheckboxSwitch = '/routerCheckboxSwitch';
  static const String routerTextField = '/textField';
}

Map<String, WidgetBuilder> getRouters(BuildContext context) {
  return {
    RouterUtil.routerMainTab: (context) => const MainTabBarCtrl(),
    RouterUtil.routerMarket: (context) => const MarketPage(),
    RouterUtil.routerTrade: (context) => const TradePage(),
    RouterUtil.routerWidgetButton: (context) => const WidgetButton(),
    RouterUtil.routerWidgetText: (context) => const TextWidgeDemo(),
    RouterUtil.routerSingleScroll: (context) => const WidgeKnowledge(),
    RouterUtil.routerCheckboxSwitch:(context) => const CheckboxSwitch(),
    RouterUtil.routerTextField:(context) => const TextFieldDemo(),
  };
}
