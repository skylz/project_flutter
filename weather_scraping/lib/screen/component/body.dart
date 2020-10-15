import 'package:flutter/material.dart';
import 'package:weather_scraping/components/tag_card.dart';
import 'package:weather_scraping/model/movie.dart';
import 'package:weather_scraping/screen/component/categories.dart';
import 'package:weather_scraping/constant.dart';
import 'package:weather_scraping/screen/component/weather_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CategoryList(), Tags(), WeatherCarousel()],
    );
  }
}
