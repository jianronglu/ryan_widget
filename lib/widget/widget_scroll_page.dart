import 'package:flutter/material.dart';
import '../base/base_page_state.dart';
import 'sub_page/widge_text.dart';

class WidgeKnowledge extends StatefulWidget {
  const WidgeKnowledge({Key? key}) : super(key: key);

  @override
  State<WidgeKnowledge> createState() => _WidgeKnowledgeState();
}

class _WidgeKnowledgeState extends BasePageState<WidgeKnowledge> {
  List<String> _items = ['WidgetText', 'CustomScrollView'];
  Widget _createItem(String value) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TextWidgeDemo()),
        );
      },
      child: SizedBox(
        height: 44.0,
        child: Text(
          value,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //左对齐
          children: _items.map((e) => _createItem(e)).toList(),
        ),
      ),
    );
  }
}
