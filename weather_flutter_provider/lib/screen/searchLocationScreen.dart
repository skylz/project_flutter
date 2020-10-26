import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_scraping/component/weatherTile.dart';
import 'package:weather_scraping/services/loadJson.dart';

class SearchLoactionScreen extends StatefulWidget {
  static const String id = 'SearchLoactionScreen';
  @override
  _SearchLoactionScreenState createState() => _SearchLoactionScreenState();
}

class _SearchLoactionScreenState extends State<SearchLoactionScreen> {
  var _controller = TextEditingController();

  List<String> locationList = [];
  List<dynamic> locationCodeList = [];
  List<String> filterLocationList = [];

  Map<String, dynamic> weatherLocation;

  void loadLocationData() async {
    weatherLocation = await parseJson();
    setState(() {
      locationList = weatherLocation.keys.toList();
      filterLocationList = locationList;
      locationCodeList = weatherLocation.values.toList();
    });
  }

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
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: filterLocationList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return WeatherTile(
                      weatherList: filterLocationList,
                      index: index,
                      locationCodeList: locationCodeList,
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
