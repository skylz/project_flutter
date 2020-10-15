import 'package:flutter/material.dart';
import 'package:weather_scraping/constant.dart';

class Tags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> tags = ['너무 더워요', '아이스아메리카노', '해가 쨍쨍', '아이스크림'];
    return Container(
      // margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 36,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (context, index) => TagCard(tag: tags[index])),
    );
  }
}

class TagCard extends StatelessWidget {
  final String tag;
  TagCard({this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: kDefaultPadding),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        tag,
        style: TextStyle(color: kTextColor.withOpacity(0.8), fontSize: 16),
      ),
    );
  }
}
