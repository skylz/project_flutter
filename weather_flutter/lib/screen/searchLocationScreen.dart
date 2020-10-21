import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_scraping/component/weatherTile.dart';
import 'package:weather_scraping/services/loadJson.dart';
import '../model/location.dart';

// 전국의 위치를 알려주는 List Scroll View Page
class SearchLoactionScreen extends StatefulWidget {
  static const String id = 'SearchLoactionScreen';
  @override
  _SearchLoactionScreenState createState() => _SearchLoactionScreenState();
}

class _SearchLoactionScreenState extends State<SearchLoactionScreen> {
  // TextEditingController를 사용하면 text를 보다 자유자재로 컨트롤 할 수 있다.
  // _controller가 해당 페이지 내의 모든 widget에 영향을 끼칠 수 있도록 하기 위하여 가장 바깥쪽에 배치한다.
  var _controller = TextEditingController();

  // 행정동명을 저장하기 위한 리스트
  List<String> locationList = [];
  // 행정동 코드를 저장하기 위한 리스트
  List<dynamic> locationCodeList = [];
  // Filter List 생성
  // Filter List는 검색창에 검색했을 때 해당 단어를 포함한 주소들이 나오게끔 하기 위해서임.
  List<String> filterLocationList = [];

  Map<String, dynamic> weatherLocation;

  // load Data
  // TODO:  여기에 왜 filter를 주는지 모르겠네... 내일 알아봐야할듯!
  void loadLocationData() async {
    weatherLocation = await parseJson();
    setState(() {
      locationList = weatherLocation.keys.toList();
      // 아래의 코드가 없으면 화면이 전환되었을 떄 바로 location card tile이 출력되지 않는다.
      filterLocationList = locationList;
      locationCodeList = weatherLocation.values.toList();
    });
  }

  // initState는 화면이 실행되자마자 바로 실행되는 함수이다.
  // 화면이 실행되자마자 weather_dict.json파일을 불러와야 하므로 위의 loadLoactionData()함수를 initState()에 넣는다.
  @override
  void initState() {
    loadLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  controller: _controller,
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      hintText: '지역을 검색해주세요.',
                      prefix: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
                        child: Icon(Icons.search),
                      ),
                      suffix: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                        },
                      )),
                  // onChanged를 통하면 TextFiled에 입력되는 글들을 추적할 수 있다.
                  // Value를 담고 있는 리스트만을 뽑아서 FilterList에 담아주어야 한다.
                  // where는 조건과 일치하는 List의 모든 항목 필터링
                  // locationList.where((location))는 locationList을 where절인 location에 복사하는 것.
                  // location.contains(value)는 value를 담고 있는 location을 뽑아냄
                  // location은 WhereIterable<String>임 따라서 이를 List로 만들기 위해 .toList() 수행.
                  onChanged: (value) {
                    setState(() {
                      filterLocationList = locationList
                          .where((location) => location.contains('$value'))
                          .toList();
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // TODO: Expanded 명령어 정리 한번 하기
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: filterLocationList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return WeatherTile(
                      weatherList: filterLocationList,
                      index: index,
                      locationDictionary: weatherLocation,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
