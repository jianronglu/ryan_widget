import 'dart:ffi';
import 'package:flutter/material.dart';
import '../../home/model/home_view_model.dart';
import '../../../constants/common_constant.dart';

class GridViewItem extends StatelessWidget {
  final String? title;
  final TextStyle? style;
  final String? iconName;

  const GridViewItem({
    Key? key,
    this.title,
    this.style,
    this.iconName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Expanded(
            child: Image(
              width: 30,
              height: 30, //为啥不能传进来
              image: AssetImage(iconName ?? StringConstant.def),
            ),
          ),
          const Spacer(),
          Expanded(
              child: Text(
            title ?? StringConstant.def,
            style: style,
            overflow: TextOverflow.fade, //溢出无色
            softWrap: false,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          )),
          const Spacer(),
        ],
      ),
    );
  }
}

class HomeGridView extends StatefulWidget {
  final List<GridViewItemModel> items;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final double crossAxisSpacing;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double childAspectRatio; //宽高比

  const HomeGridView({
    Key? key,
    this.width,
    this.height,
    required this.items,
    this.margin,
    this.crossAxisSpacing = 0,
    required this.crossAxisCount,
    this.mainAxisSpacing = 0,
    this.childAspectRatio = 1,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeGrideViewState();
}

class _HomeGrideViewState extends State<HomeGridView> {

  Widget _createGridItem(int index) {
    final title = HomeViewModel.gridViewItems[index].title;
    final iconName = HomeViewModel.gridViewItems[index].iconName;
    return GestureDetector(
      onTap: () {
        print(title);
      },
      child: GridViewItem(
        title: title,
        iconName: iconName,
        style: const TextStyle(
          color: Colors.black,
          //backgroundColor: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      margin: widget.margin,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
            crossAxisSpacing: widget.crossAxisSpacing, //水平间距
            mainAxisSpacing: widget.mainAxisSpacing, //
            childAspectRatio: widget.childAspectRatio, //宽高比
          ),
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, int index) =>
              _createGridItem(index)),
    );
  }
}
