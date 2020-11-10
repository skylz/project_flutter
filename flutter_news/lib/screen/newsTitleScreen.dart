import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controller/newsController.dart';
import '../model/newsModel.dart';

class NewsTitleScreen extends StatelessWidget {
  // arguments of GetX Controller
  final NewsController _newsController = Get.put(NewsController());
  final int titleIndex = Get.arguments;
  News newsData;

  @override
  Widget build(BuildContext context) {
    newsData = _newsController.newsListData[titleIndex];

    return Stack(
      fit: StackFit.expand,
      children: [
        // Image
        Image.asset(
          "assets/images/${_newsController.backGround}.png",
          fit: BoxFit.cover,
        ),
        // Black Layer
        DecoratedBox(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.5))),
        // MetaData
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
              child: Text(
                newsData.heading,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w300),
              ),
            ),
            _subTitle(context),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                newsData.author,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w300),
              ),
            ),
            Spacer(),
            Center(
              child: Column(
                children: [
                  Text(
                    '지금부터 중립입니다.',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(
                    "assets/icons/downArrow.svg",
                    height: 15,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.12,
            )
          ],
        ),
      ],
    );
  }

  _subTitle(BuildContext context) {
    if (newsData.subheading != '') {
      return Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Text(
          newsData.subheading == '' ? '' : newsData.subheading,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white, fontWeight: FontWeight.w300),
        ),
      );
    } else {
      return SizedBox(height: 10);
    }
  }
}
