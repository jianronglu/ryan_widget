import 'package:flutter/material.dart';
import '../../../constants/common_constant.dart';

class HomeNewsList extends StatefulWidget {
  final List<String> items;

  const HomeNewsList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<HomeNewsList> createState() => _HomeNewsListState();
}

class _HomeNewsListState extends State<HomeNewsList> {
  Widget _createListItem(int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0.5, 15, 0),
      height: 80.0,
      // color: Colors.red,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text(
                  '1222222222222222222222222222112322344524',
                  style:
                  TextStyle(
                      // backgroundColor: Colors.grey,
                      fontSize: 16),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 8,),
                Text(
                  '333333',
                  style:
                  TextStyle(
                      // backgroundColor: Colors.yellow,
                      fontSize: 12),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: Image(image: AssetImage(ImageConstant.placehold),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget.items.length,
        itemBuilder: (BuildContext content, int index) =>
            _createListItem(index));
  }
}
