import 'package:flutter/material.dart';
import '../home/model/home_view_model.dart';
import '../base/base_page_state.dart';

class WidgeKnowledge extends StatefulWidget {
  const WidgeKnowledge({Key? key}) : super(key: key);

  @override
  State<WidgeKnowledge> createState() => _WidgeKnowledgeState();
}

class _WidgeKnowledgeState extends BasePageState<WidgeKnowledge> {
  @override
  String getTitle() {
    return 'Widget List';
  }

  @override
  bool showBackBtn() {
    return false;
  }

  final List<SingleScrollModel> _items = HomeViewModel.scrollItems;
  Widget _createItem(SingleScrollModel item) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => TextWidgeDemo()),
        // );
        Navigator.pushNamed(context, item.router);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 44.0,
            child: Text(
              item.title,
              style: const TextStyle(fontSize: 30),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  @override
  Widget createBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //左对齐
        children: _items.map((e) => _createItem(e)).toList(),
      ),
    );
  }
}
