import 'package:flutter/material.dart';
import '../../base/base_page_state.dart';

class WidgetButton extends StatefulWidget {
  const WidgetButton({Key? key}) : super(key: key);

  @override
  State<WidgetButton> createState() => _WidgetButtonState();
}

class _WidgetButtonState extends BasePageState<WidgetButton> {
  @override
  String getTitle() {
    return '按钮组件';
  }

  @override
  Widget createBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () {
                  print('ElevatedButton Clicked');
                },
                child: const Text('ElevatedButton 悬浮按钮')),
            const Divider(),
            TextButton(
                onPressed: () {
                  print('TextButton');
                },
                child: const Text('TextButton 文本按钮')),
            const Divider(),
            OutlinedButton(
                onPressed: () {
                  print('OutlinedButton');
                },
                child: const Text('OutlinedButton 默认有一个边框')),
            const Divider(),
            IconButton(
                onPressed: (){
                  print('IconButton');
                },
                icon: const Icon(Icons.add_a_photo)),
            const Divider(),

          ],
        ),
      ),
    );
  }
}
