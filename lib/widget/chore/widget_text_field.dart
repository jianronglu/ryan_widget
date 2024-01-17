import 'package:flutter/material.dart';
import '../../base/base_page_state.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends BasePageState<TextFieldDemo> {
  late final TextEditingController _nameController;

  @override
  String getTitle() {
    return 'TextField';
  }

  @override
  void initState() {
    _nameController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget createBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            autofocus: true,//聚焦
            keyboardType: TextInputType.number,//键盘类型
            //cursorColor: Colors.red,//光标颜色
          ),
        ],
      ),

    );
  }
}
