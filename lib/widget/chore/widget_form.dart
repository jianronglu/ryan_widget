import 'package:flutter/material.dart';
import '../../base/base_page_state.dart';

class FormDemo extends StatefulWidget {
  const FormDemo({Key? key}) : super(key: key);

  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends BasePageState<FormDemo> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  String getTitle() {
    return '表单 Form';
  }

  @override
  Widget createBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: _nameController,
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '用户名或者邮箱',
                icon: Icon(Icons.person),
              ),
              validator: (v) {
                return v!.trim().isNotEmpty ? null : '用户名不能为空';
              },
            ),
            TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '您的登录密码',
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
              validator: (v) {
                return v!.trim().length > 5 ? null : '密码不能少于6位';
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    child: Text(
                      '登录',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      if ((_formKey.currentState as FormState).validate()) {
                        print('验证通过');
                      }
                    },
                  )),
                  Expanded(
                    // 通过Builder来获取ElevatedButton所在widget树的真正context(Element)
                    child: Builder(
                      builder: (context) {
                        return ElevatedButton(
                            onPressed: () {
                              //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                              if (Form.of(context).validate()) {
                                print('验证通过2');
                              }
                            },
                            child: Text('按钮2'));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
