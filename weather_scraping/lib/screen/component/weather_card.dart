import 'package:flutter/material.dart';
import 'package:weather_scraping/constant.dart';
import 'package:weather_scraping/model/movie.dart';

class WeatherCarousel extends StatefulWidget {
  @override
  _WeatherCarouselState createState() => _WeatherCarouselState();
}

class _WeatherCarouselState extends State<WeatherCarousel> {
  PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.7,
        child: PageView.builder(
            controller: _pageController,
            itemCount: movies.length,
            itemBuilder: (context, index) => WeatherCard(
                  movie: movies[index],
                )),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final Movie movie;

  WeatherCard({this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(
              movie.title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                boxShadow: [kDefaultShadow],
                borderRadius: BorderRadius.circular(50),
                color: Colors.green),
          )),
        ],
      ),
    );
  }
}
