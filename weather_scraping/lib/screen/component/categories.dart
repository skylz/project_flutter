import 'package:flutter/material.dart';
import 'package:weather_scraping/constant.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedCategory = 0;
  List<String> categories = ['오늘의 날씨', '오늘의 미세먼지', '오늘의 음식'];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => buildCategory(index, context),
          itemCount: categories.length,
        ));
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categories[index],
                style: Theme.of(context).textTheme.headline6.copyWith(
                    fontWeight: FontWeight.w600,
                    color: index == selectedCategory
                        ? kTextColor
                        : Colors.black.withOpacity(0.4)),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                height: 6,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == selectedCategory
                        ? kSecondaryColor
                        : Colors.transparent),
              )
            ],
          ),
        ),
      ),
    );
  }
}
