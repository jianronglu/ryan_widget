import 'package:flutter/material.dart';

class HomeBannerView extends StatefulWidget {
  final List<String> items;
  const HomeBannerView({Key? key, required this.items}) : super(key: key);

  @override
  State<HomeBannerView> createState() => _HomeBannerViewState();
}

class _HomeBannerViewState extends State<HomeBannerView> {

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        pageSnapping: true,
        itemCount: widget.items.length,
        scrollDirection: Axis.horizontal,
        onPageChanged: (position) {
          print('当前索引为：$position');
        },
        controller: PageController(),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey,
            alignment: Alignment.center,
            child: Text(
              '${widget.items[index]}',
              style: TextStyle(color: Colors.red, fontSize: 50),),
          );
        });
  }
}
