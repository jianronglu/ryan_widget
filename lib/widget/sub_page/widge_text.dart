import 'package:flutter/material.dart';
import '../../base/base_page_state.dart';
import '../../home/model/home_view_model.dart';

class NorTextView extends StatelessWidget {
  final TextModel model;
  const NorTextView({Key? key, required this.model}) : super(key: key);

  Widget getContentView(TextModel model) {
    return Text(
      model.text,
      maxLines: model.maxLines,
      overflow: model.overflow,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            model.hintText,
            style: model.hintStyle,
          ),
          const SizedBox(
            height: 5.0,
          ),
          getContentView(model),
          const Divider(),
        ],
      ),
    );
  }
}

class TextRichView extends NorTextView {
  const TextRichView({Key? key, required super.model}) : super(key: key);

  @override
  Widget getContentView(TextModel model) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: '富文本: '),
      TextSpan(
        text: model.text,
        style: const TextStyle(color: Colors.blue),
      ),
    ]));
  }
}

class TextDecorationView extends NorTextView {
  const TextDecorationView({Key? key, required super.model}) : super(key: key);

  @override
  Widget getContentView(TextModel model) {
    return Text(
      model.text,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 16.0,
        fontFamily: 'Courier',
        background: Paint()..color = Colors.yellow,
        decoration: TextDecoration.lineThrough,
        decorationStyle: TextDecorationStyle.solid,
      ),
    );
  }
}

class UPDefaultTextStyle extends NorTextView {
  const UPDefaultTextStyle({Key? key, required super.model}) : super(key: key);

  @override
  Widget getContentView(TextModel model) {
    return const DefaultTextStyle(
      style: TextStyle(color: Colors.red, fontSize: 40.0),
      textAlign: TextAlign.start,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('DefaultTextStyle'),
          Text('继承文本样式'),
          Text(
            '哈哈哈，我就不继承',
            style: TextStyle(
              inherit: false,
              fontSize: 19,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class TextWidgeDemo extends StatefulWidget {
  const TextWidgeDemo({Key? key}) : super(key: key);

  @override
  State<TextWidgeDemo> createState() => _TextWidgeDemoState();
}

class _TextWidgeDemoState extends BasePageState<TextWidgeDemo> {
  @override
  String getTitle() {
    return 'Widget Text 学习';
  }

  Widget _createItemView() {
    TextModel model = HomeViewModel.longTextModel();
    return NorTextView(model: model);
  }

  Widget _createRichView() {
    final model = TextModel(
      hintText: 'Text.rich',
      // height：该属性用于指定行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height
      hintStyle: const TextStyle(
          fontSize: 18,
          color: Colors.pink,
          height: 3,
          backgroundColor: Colors.grey),
      text: 'https://flutterchina.club',
    );
    return TextRichView(model: model);
  }

  Widget _createDecorationView() {
    final model = TextModel(
      hintText: 'Decoration',
      hintStyle: const TextStyle(fontSize: 18, color: Colors.pink),
      text: 'Hello World',
    );
    return TextDecorationView(model: model);
  }

  Widget _createDefaultTextStyle() {
    return UPDefaultTextStyle(
        model: TextModel(hintText: 'DefaultTexStyle', text: ''));
  }

  @override
  Widget createBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _createItemView(),
          _createRichView(),
          _createDecorationView(),
          _createDefaultTextStyle(),
        ],
      ),
    );
  }
}
