import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_weather/common/streams.dart';

class LoadingView extends StatefulWidget {
  final Widget child;
  final Stream<bool> loadingStream;

  LoadingView({Key key, @required this.loadingStream, @required this.child})
      : assert(child != null && loadingStream != null),
        super(key: key);

  @override
  State createState() => LoadingState();
}

/// 带有圆形加载进度条的Stack
class LoadingState extends State<LoadingView>
    with TickerProviderStateMixin, StreamSubController {
  AnimationController _controller;
  Animation<Size> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = SizeTween(begin: Size(50, 50), end: Size.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    dismiss();

    widget.loadingStream.listen((loading) {
      if (loading) {
        show();
      } else {
        dismiss();
      }
    }).bindLife(this);
  }

  @override
  void dispose() {
    _controller?.dispose();
    subDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        widget.child,
        Container(
          margin: const EdgeInsets.only(top: 40),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                child: Container(
                  height: _animation.value.height,
                  width: _animation.value.width,
                  child: const RefreshProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  /// 显示加载进度条
  void show() {
    _controller.reset();
  }

  /// 隐藏进度条
  void dismiss() {
    _controller.forward();
  }
}
