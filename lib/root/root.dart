import 'package:flutter/material.dart';
import '../root/main_tabbar.dart';

class SGZQ extends StatelessWidget {
  const SGZQ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '申港',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MainTabBarCtrl(),
    );
  }
}
