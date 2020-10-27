import 'package:flutter/material.dart';
import 'package:weather_scraping/component/weatherTile.dart';
import 'package:weather_scraping/provider/weatherProvider.dart';
import '../getIt.dart';

class SearchLoactionScreen extends StatefulWidget {
  static const String id = 'SearchLoactionScreen';
  @override
  _SearchLoactionScreenState createState() => _SearchLoactionScreenState();
}

class _SearchLoactionScreenState extends State<SearchLoactionScreen> {
  var _controller = TextEditingController();
  final provider = getIt.get<WeatherProvider>();

  // ListView 출력을 위한 filterLocation
  List<String> filterLocationList;

  Future loadFilterLocationList() async {
    await provider.getLoadLocationData();
    List<String> filterLocationList = provider.getLocationList();
    return filterLocationList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadFilterLocationList(),
        builder: (context, snapshot) {
          return Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  body: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                        child: TextField(
                          controller: _controller,
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: '지역을 검색해주세요.',
                              filled: false,
                              prefixIcon: Icon(Icons.search),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  _controller.clear();
                                },
                              )),
                          onChanged: (value) {
                            setState(() {
                              filterLocationList = provider
                                  .getLocationList()
                                  .where(
                                      (location) => location.contains('$value'))
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
                          itemCount: (snapshot.data == null
                              ? 0
                              : snapshot.data.length),
                          itemBuilder: (BuildContext context, int index) {
                            provider.getNameCode(index);
                            return WeatherTile();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
