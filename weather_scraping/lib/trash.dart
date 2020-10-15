// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/services.dart';
// import 'package:weather_scraping/constant.dart';

// // 내가 전달받아야 할 것.
// List<String> historyLocation = [];
// List<List<String>> historyLoscationInfo = [];

// class TestScreen extends StatefulWidget {
//   static String id = 'testscreen';
//   final String selectedLocation;
//   final List<String> selectedLocationInfo;

//   TestScreen({Key key, this.selectedLocation, this.selectedLocationInfo})
//       : super(key: key);

//   @override
//   _TestScreenState createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   @override
//   void initState() {
//     print(widget.selectedLocation);
//     print(widget.selectedLocationInfo);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//         value: const SystemUiOverlayStyle(
//           statusBarIconBrightness: Brightness.light,
//           statusBarBrightness: Brightness.light,
//         ),
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('주의깊게 본 지역이에요!'),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 CarouselSlider(
//                   options: CarouselOptions(
//                       height: 400.0, enableInfiniteScroll: false),
//                   items: [
//                     '서울',
//                     '부산',
//                     '대구',
//                     '인천',
//                     '광주',
//                     '대전',
//                     '울산',
//                     '세종',
//                     '경기도',
//                     '충청북도',
//                     '충청남도',
//                     '전라북도',
//                     '전라남도',
//                     '경상북도',
//                     '경상남도',
//                     '제주도'
//                   ].map((i) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return Container(
//                             width: MediaQuery.of(context).size.width,
//                             margin: EdgeInsets.only(left: 24, bottom: 40),
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(29),
//                                 boxShadow: [
//                                   BoxShadow(
//                                       offset: Offset(0, 10),
//                                       blurRadius: 10,
//                                       color: kShadowColor)
//                                 ]),
//                             child: Column(
//                               children: [
//                                 Text(
//                                   '$i',
//                                   style: TextStyle(
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.w800),
//                                 ),
//                                 SizedBox(
//                                   height: 20.0,
//                                 ),
//                                 Text('27.6℃'),
//                                 Text('체감온도(28.6℃)'),
//                                 Text('습도(60%)'),
//                                 Text('동 4.7km/h'),
//                                 Text('강수량 0mm'),
//                               ],
//                             ));
//                       },
//                     );
//                   }).toList(),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:weather_scraping/constant.dart';

// import 'package:weather_scraping/screen/test.dart';
// import 'package:weather_scraping/services/loadJson.dart';
// import 'package:weather_scraping/services/getTodayWeather.dart';
// import 'package:weather_scraping/services/wideWeather.dart';

// // List<Map<String, dynamic>> wideWeatehr;
// // Map<String, dynamic> weatherLocation;

// class HomeScreen extends StatefulWidget {
//   static const String id = 'homescreen';

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // loadData();
//     // print('run');
//   }

//   // void loadData() async {
//   //   weatherLocation = await parseJson();
//   //   wideWeatehr = await getWideWeatherData();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('우리 동네 날씨는?'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('우리 동네 날씨를 검색해보세요.'),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
//                 child: Container(
//                   child: OutlineButton(
//                     color: Colors.blue,
//                     borderSide: BorderSide(color: Colors.blue),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0)),
//                     onPressed: () {
//                       Navigator.pushNamed(context, SearchWeatherScreen.id);
//                     },
//                     child: Padding(
//                       padding: EdgeInsets.all(12),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.search,
//                             color: Colors.black54,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             '어떤 지역의 날씨가 궁금하세요?',
//                             style: TextStyle(color: Colors.black54),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               FlatButton(
//                 child: Text('go to test'),
//                 onPressed: () {
//                   Navigator.pushNamed(context, TestScreen.id);
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
