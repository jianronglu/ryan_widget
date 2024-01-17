import 'package:flutter/material.dart';
import '../../base/base_page_state.dart';

class CheckboxSwitch extends StatefulWidget {
  const CheckboxSwitch({Key? key}) : super(key: key);

  @override
  State<CheckboxSwitch> createState() => _CheckboxSwitchState();
}

class _CheckboxSwitchState extends BasePageState<CheckboxSwitch> {
  bool? _checkboxValue = true;
  bool _switchSelectedValue = true;

  @override
  String getTitle() {
    return 'checkbox switch';
  }

  @override
  Widget createBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Column(

          children: [
            Checkbox(
                value: _checkboxValue,
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    _checkboxValue = value;
                  });
                }),
            const Divider(),
            Switch(
                value: _switchSelectedValue,
                onChanged: (value){
                  setState(() {
                    _switchSelectedValue = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
