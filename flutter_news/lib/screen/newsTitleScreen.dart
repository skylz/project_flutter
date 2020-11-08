import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../controller/newsController.dart';
import 'dart:math';

class NewsContentsScreen extends StatefulWidget {
  @override
  _NewsContentsScreenState createState() => _NewsContentsScreenState();
}

class _NewsContentsScreenState extends State<NewsContentsScreen> {
  // arguments of GetX Controller
  final NewsController _newsController = Get.put(NewsController());
  final int titleIndex = Get.arguments;

  // arguments of GetX Controller
  final List<String> photoList = ["oliagozha", "sunflower"];
  final randomNumber = Random().nextInt(2);

  // arguments of GetX Controller
  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen;
  double _panelHeightClosed = 95.0;

  @override
  void initState() {
    super.initState();
    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;
    // background를 위한 random Number 생성
    return Stack(
      fit: StackFit.expand,
      children: [
        // Image
        Image.asset(
          "assets/images/${photoList[randomNumber]}.png",
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
                _newsController.newsListData[titleIndex].heading,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                _newsController.newsListData[titleIndex].author,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w100),
              ),
            ),
            Spacer(),
            Center(
              child: Text(
                '지금부터 중립입니다.',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w200),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: SvgPicture.asset(
                "assets/icons/downArrow.svg",
                height: 15,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SlidingUpPanel(
              maxHeight: _panelHeightOpen,
              minHeight: _panelHeightClosed,
              parallaxEnabled: true,
              parallaxOffset: 0.5,
              panel: Center(),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              onPanelSlide: (double pos) => setState(() {
                _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                    _initFabHeight;
              }),
            )
          ],
        ),
      ],
    );
  }
}
