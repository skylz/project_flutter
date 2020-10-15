import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_scraping/screen/weatherScreen.dart';
import 'package:weather_scraping/services/loadJson.dart';
import 'home.dart';

class SearchWeatherScreen extends StatefulWidget {
  static const String id = 'searchScreen';

  @override
  _SearchWeatherScreenState createState() => _SearchWeatherScreenState();
}

class _SearchWeatherScreenState extends State<SearchWeatherScreen> {
  var _controller = TextEditingController();

  // 행정동을 저장하기 위한 리스트
  List<String> locationList = [];
  // Fliter list 생성
  List<String> filterLocationList = [];

  // load Data
  void loadLocationData() async {
    Map<String, dynamic> weatherLocation = await parseJson();
    setState(() {
      locationList = weatherLocation.keys.toList();
      filterLocationList = locationList;
    });
  }

  void _onSearch(value) {
    setState(() {
      filterLocationList =
          locationList.where((item) => item.contains('$value')).toList();
    });
  }

  @override
  void initState() {
    loadLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                TextField(
                  controller: _controller,
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      hintText: '지역을 검색해주세요.',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _controller.clear();
                        },
                        icon: Icon(Icons.clear),
                      )),
                  onChanged: _onSearch,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: filterLocationList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WeatherScreen(
                                              selectedLocation:
                                                  filterLocationList[index])));
                                },
                                title: Text('${filterLocationList[index]}')),
                          );
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
