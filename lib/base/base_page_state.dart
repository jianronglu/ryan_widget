import 'package:flutter/material.dart';

abstract class BasePageState<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  void didChangeDependencies() {
    print('BasePage->didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void initState() {
    print('BasePage->initState');
    super.initState();
  }

  @override
  void dispose() {
    print('BasePage->dispose');
    super.dispose();
  }
}
