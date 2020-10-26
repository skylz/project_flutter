import 'dart:math';
import 'package:after_layout/after_layout.dart';
import 'package:cute_kitten/model/glitch/noInternetGlitch.dart';
import 'package:cute_kitten/provider/catProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import '../getIt.dart';

class CatGrid extends StatefulWidget {
  @override
  _CatGridState createState() => _CatGridState();
}

class _CatGridState extends State<CatGrid> with AfterLayoutMixin {
  // provider안에 CatProvider가 등록되어 있는 구조.
  final provider = getIt.get<CatProvider>();
  List<Widget> catPhotos = [];
  List<StaggeredTile> catPhotoTiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: new AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                catPhotoTiles.clear();
                catPhotos.clear();
                provider.refreshGrid();
              },
            )
          ],
          backgroundColor: Colors.white,
          centerTitle: true,
          title: new Text(
            'Cute kitten',
            style: GoogleFonts.pacifico(),
          ),
        ),
        body: new Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: catPhotos.length == 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    staggeredTileBuilder: (index) => catPhotoTiles[index],
                    itemCount: catPhotos.length,
                    itemBuilder: (context, index) {
                      return catPhotos[index];
                    })));
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // 여기서 getRandomCatPhoto()가 실행
    // getRandomCatPhoto()이 photo를 _streamController에 넣어줌.
    provider.getTwentyRandomPhoto();

    //  provider.catPhotoStream에 의해 _streamController.stream이 return되고,
    // _streamController.stream 안의 값을 listen을 통해 받아주는 것.
    provider.catPhotoStream.listen((snapshot) {
      snapshot.fold((l) {
        if (l is NoInternetGlitch) {
          Color randomColor = Color.fromRGBO(Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255), 1);
          catPhotos.add(CatPhotoErrorTile(randomColor, "Unable to Connect"));
        }
      }, (r) {
        catPhotos.add(CatPhotoTile(r.url));
      });
      int count = Random().nextInt(4);
      catPhotoTiles.add(StaggeredTile.count(count, count));

      setState(() {});
    });
  }
}

class CatPhotoTile extends StatelessWidget {
  final String imageUrl;
  const CatPhotoTile(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Center(
          child: new Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(10.0)),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover),
                ),
              ))),
    );
  }
}

class CatPhotoErrorTile extends StatelessWidget {
  const CatPhotoErrorTile(this.backgroundColor, this.errorMessage);
  final Color backgroundColor;
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(errorMessage),
          ),
        ),
      ),
    );
  }
}
