import 'package:flutter/material.dart';
import '../../base/base_page_state.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends BasePageState<TextFieldDemo> {
  late final TextEditingController _nameController;
  String? _nameText;
  String? _pwdText;
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  @override
  String getTitle() {
    return 'TextField & Form';
  }

  @override
  void initState() {
    /*
    _nameController = TextEditingController(text: '可以设置默认值');
    _nameController.selection =
        TextSelection(baseOffset: 2, extentOffset: _nameController.text.length);
   */
    _nameController = TextEditingController();
    _nameController.addListener(() {
      _nameText = _nameController.text;
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _nameFocusNode.addListener(() {
      print('name_focus_node:${_nameFocusNode.hasFocus}');
    });
    _pwdFocusNode.addListener(() {
      print('pwd_focus_node:${_pwdFocusNode.hasFocus}');
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    keyboardHidden();
    super.dispose();
  }

  void keyboardHidden() {
    _nameFocusNode.unfocus();
    _pwdFocusNode.unfocus();
  }

  void keybordShow() {
    if(!_nameFocusNode.hasFocus) {
      _nameFocusNode.requestFocus();
    }
  }

  @override
  Widget createBody(BuildContext context) {
    return GestureDetector(
      onTap: (){
        keyboardHidden();
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _nameController, //使用controller 监听变化
              autofocus: true, //聚焦
              focusNode: _nameFocusNode,
              keyboardType: TextInputType.text, //键盘类型
              decoration: _createDecoration('姓名','请输入姓名', Icons.person),
            ),
            TextField(
              //controller:_pwdController,
              onChanged: (value) {
                //使用 onChanged 监听变化
                _pwdText = value;
              },
              autofocus: false,
              focusNode: _pwdFocusNode,
              keyboardType: TextInputType.number,
              decoration: _createDecoration('密码', '请输入密码', Icons.lock),
            ),
            ElevatedButton(
              child: Text('登录'),
              onPressed: () {
                keyboardHidden();
                print('name:$_nameText, pwd:$_pwdText');
              },
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _createDecoration(String labelText, String hintText, IconData iconData) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.grey),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon:  Icon(iconData),
      focusedBorder: UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
      ),
    );
  }
}
