import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controller/newsController.dart';
import '../model/newsModel.dart';

class NewsTitleScreen extends StatefulWidget {
  // arguments of GetX Controller
  @override
  _NewsTitleScreenState createState() => _NewsTitleScreenState();
}

class _NewsTitleScreenState extends State<NewsTitleScreen> {
  final NewsController _newsController = Get.put(NewsController());
  final int titleIndex = Get.arguments;
  News newsData;

  // 작은 따옴표 안에 있는 단어들이 담겨있는 Map
  Map<String, List<int>> singleQuotationText = {};

  @override
  void initState() {
    super.initState();
    newsData = _newsController.newsListData[titleIndex];
    _singleQuotation(newsData.content);
  }

  void _singleQuotation(List<String> newsContent) {
    print('_singleQuotation');
    // All tag 추가
    singleQuotationText['All'] =
        Iterable<int>.generate(newsContent.length).toList();
    for (var i = 0; i < newsContent.length; i++) {
      // 작은 따옴표 안에 있는 단어를 추출하는 코드
      RegExp regExp = RegExp(r"((\‘|\'){1}(\S+)?(\s+)*(\S+)?(\’|\'){1})");
      Iterable<Match> resSingleText = regExp.allMatches(newsContent[i]);
      // 추출된 단어들은 Map으로 변환하는 코드
      resSingleText.toList().forEach((element) {
        addValueToMap(singleQuotationText, element[0].toString(), i);
      });
    }
    print(singleQuotationText);
    print(singleQuotationText.runtimeType);
  }

  void addValueToMap<K, V>(Map<K, List<V>> map, K key, V value) =>
      map.update(key, (list) => list..add(value), ifAbsent: () => [value]);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        // Image
        Image.asset(
          "assets/images/${_newsController.backGround}.png",
          fit: BoxFit.cover,
        ),
        // Black Layer
        DecoratedBox(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.4))),
        // MetaData
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 100),
              child: Text(
                newsData.heading,
                softWrap: true,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w300),
              ),
            ),
            _subTitle(context),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
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
            const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
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
