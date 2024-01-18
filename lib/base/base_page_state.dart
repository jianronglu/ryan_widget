import 'package:flutter/material.dart';

abstract class BasePageState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {
  String getTitle() {
    return '';
  }

  bool showAppBar() {
    return true;
  }

  bool showBackBtn() {
    return true;
  }

  Widget _createBackBtn() {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  Widget createBody(BuildContext context) {
    return const Placeholder();
  }

  TextStyle getStyle() {
    return const TextStyle(fontSize: 18);
  }

  AppBar _createAppBar() {
    return AppBar(
      title: Text(
        getTitle(),
        style: getStyle(),
      ),
      centerTitle: true,
      leading: showBackBtn() ? _createBackBtn() : null,
    );
  }

  Widget? createBottomNavigationBar() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    print('${runtimeType}->build');
    return Scaffold(
      appBar: showAppBar() ? _createAppBar() : null,
      body: createBody(context),
      bottomNavigationBar: createBottomNavigationBar(),
    );
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    print('${runtimeType}->didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print('${runtimeType}->didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void initState() {
    print('${runtimeType}->initState');
    super.initState();
  }

  @override
  void deactivate() {
    print('${runtimeType}->deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('${runtimeType}->dispose');
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      print('${runtimeType}app进入前台');
    } else if (state == AppLifecycleState.inactive) {
      print('${runtimeType}app在前台但不响应事件，比如电话，touch id等');
    } else if (state == AppLifecycleState.paused) {
      print('${runtimeType}app进入后台');
    } else if (state == AppLifecycleState.detached) {
      print('${runtimeType}没有宿主视图但是flutter引擎仍然有效');
    }

    super.didChangeAppLifecycleState(state);
  }
}
