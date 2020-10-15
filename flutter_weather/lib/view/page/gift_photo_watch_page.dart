import 'package:flutter/material.dart';
import 'package:flutter_weather/generated/i18n.dart';
import 'package:flutter_weather/model/data/mzi_data.dart';
import 'package:flutter_weather/model/holder/fav_holder.dart';
import 'package:flutter_weather/utils/system_util.dart';
import 'package:flutter_weather/view/page/page_state.dart';
import 'package:flutter_weather/view/widget/custom_app_bar.dart';
import 'package:flutter_weather/view/widget/net_image.dart';
import 'package:flutter_weather/view/widget/zoomable_widget.dart';
import 'package:flutter_weather/viewmodel/gift_photo_watch_viewmodel.dart';

class GiftPhotoWatchPage extends StatefulWidget {
  final int index;
  final int max;
  final List<MziItem> photos;
  final Stream<List<MziItem>> photoStream;
  final VoidCallback loadDataFun;

  GiftPhotoWatchPage(
      {@required this.index,
      @required this.max,
      @required this.photos,
      this.photoStream,
      this.loadDataFun});

  @override
  State createState() => GiftPhotoWatchState();
}

class GiftPhotoWatchState extends PageState<GiftPhotoWatchPage> {
  PageController _pageController;
  GiftPhotoWatchViewModel _viewModel;
  int _currentPage = 0;
  bool _showAppBar = false;
  bool _canScroll = true;

  @override
  void initState() {
    super.initState();

    _currentPage = widget.index;

    _pageController =
        PageController(initialPage: _currentPage, keepPage: false);

    _viewModel = GiftPhotoWatchViewModel(photoStream: widget.photoStream);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafKey,
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: _viewModel.data.stream,
        builder: (context, snapshot) {
          final List<MziItem> list = (snapshot.data ?? widget.photos).toList();

          if (widget.photoStream != null) {
            list.addAll(List.generate(widget.max - list.length, (_) => null));
          }
          return GestureDetector(
            onTap: () => setState(() => _showAppBar = !_showAppBar),
            child: Stack(
              children: <Widget>[
                PageView.builder(
                  itemCount: list.length,
                  controller: _pageController,
                  physics: _canScroll
                      ? const ClampingScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                    if (list[index] == null && widget.loadDataFun != null) {
                      widget.loadDataFun();
                    }
                  },
                  itemBuilder: (context, index) {
                    final data = list[index];

                    if (data == null) {
                      return Center(
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: RefreshProgressIndicator(
                            backgroundColor: Colors.transparent,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        ),
                      );
                    } else {
                      final zoomImg = ZoomableWidget(
                        maxScale: 5,
                        minScale: 1,
                        child: NetImage(
                          url: data.url,
                          headers: {"Referer": data.refer},
                          placeholder: Center(
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: RefreshProgressIndicator(
                                backgroundColor: Colors.transparent,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              ),
                            ),
                          ),
                          fit: BoxFit.contain,
                        ),
                        onZoomChanged: (scale) {
                          if (index != _currentPage) return;

                          final scroll = scale == 1;
                          if (scroll != _canScroll) {
                            setState(() => _canScroll = scroll);
                          }
                        },
                      );

                      return index == _currentPage
                          ? Hero(
                              tag:
                                  "${data.url}$index${widget.photoStream != null}",
                              child: zoomImg,
                            )
                          : zoomImg;
                    }
                  },
                ),

                // 标题栏
                AnimatedOpacity(
                  opacity: _showAppBar ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: CustomAppBar(
                    title: Text(""),
                    showShadow: false,
                    color: Colors.transparent,
                    leftBtn: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (!_showAppBar) return;

                        pop(context);
                      },
                    ),
                    rightBtns: <Widget>[
                      StreamBuilder(
                        stream: _viewModel.favList.stream,
                        builder: (context, snapshot) {
                          final isFav =
                              FavHolder().isFavorite(list[_currentPage]);

                          return IconButton(
                            icon: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: isFav ? Colors.red : Colors.white,
                            ),
                            onPressed: () {
                              if (!_showAppBar) return;

                              FavHolder().autoFav(list[_currentPage]);
                            },
                          );
                        },
                      ),
                      PopupMenuButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: "save",
                            child: Text(S.of(context).imgSave),
                          ),
                          PopupMenuItem(
                            value: "wallpaper",
                            child: Text(S.of(context).setAsWallpaper),
                          ),
                        ],
                        onSelected: (value) async {
                          switch (value) {
                            case "save":
                              final result = await _viewModel
                                  .saveImage(list[_currentPage]?.url);
                              if (result) {
                                showSnack(text: S.of(context).imgSaveSuccess);
                              }

                              break;
                            case "wallpaper":
                              final result = await _viewModel
                                  .setWallpaper(list[_currentPage]?.url);
                              if (!result) {
                                showSnack(
                                    text: S.of(context).canNotSetWallpaper);
                              }

                              break;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
