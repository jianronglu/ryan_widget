import 'package:flutter/material.dart';
import '../router/router.dart';

class SGZQ extends StatelessWidget {
  const SGZQ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouterUtil.routerMainTab,
      routes: getRouters(context),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,//是否显示右上角debug
    );
  }
}
