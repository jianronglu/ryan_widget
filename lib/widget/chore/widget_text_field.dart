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
    return 'TextField';
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
  Widget createBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: _nameController, //使用controller 监听变化
            autofocus: true, //聚焦
            focusNode: _nameFocusNode,
            keyboardType: TextInputType.text, //键盘类型
            decoration: InputDecoration(
              labelText: '用户名',
              labelStyle: TextStyle(color: Colors.black),
              hintText: '请输入用户名',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.person),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
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
            decoration: InputDecoration(
              labelText: '密码',
              labelStyle: TextStyle(color: Colors.black),
              hintText: '请输入登录密码',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.lock),
              focusedBorder: UnderlineInputBorder(
                //获得焦点
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: UnderlineInputBorder(
                //未获得焦点
                borderSide: BorderSide(color: Colors.grey),
              ),
              // border: InputBorder.none,//隐藏下划线
            ),
          ),
          ElevatedButton(
            child: Text('登录'),
            onPressed: () {
              _pwdFocusNode.unfocus();
              _pwdFocusNode.unfocus();
              print('name:$_nameText, pwd:$_pwdText');
            },
          ),
        ],
      ),
    );
  }
}
