import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/block_picker.dart';
import 'package:flutter_weather/common/colors.dart';
import 'package:flutter_weather/generated/i18n.dart';
import 'package:flutter_weather/model/holder/event_send_holder.dart';
import 'package:flutter_weather/model/holder/shared_depository.dart';
import 'package:flutter_weather/utils/system_util.dart';
import 'package:flutter_weather/utils/view_util.dart';
import 'package:flutter_weather/view/page/page_state.dart';
import 'package:flutter_weather/view/page/setting_module_page.dart';
import 'package:flutter_weather/view/widget/custom_app_bar.dart';
import 'package:flutter_weather/view/widget/loading_view.dart';
import 'package:flutter_weather/viewmodel/setting_viewmodel.dart';

class SettingPage extends StatefulWidget {
  @override
  State createState() => SettingState();
}

class SettingState extends PageState<SettingPage> {
  final _viewModel = SettingViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          S.of(context).setting,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        color: Theme.of(context).accentColor,
        leftBtn: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => pop(context),
        ),
      ),
      body: LoadingView(
        loadingStream: _viewModel.isLoading.stream,
        child: StreamBuilder(
          stream: _viewModel.cacheSize.stream,
          builder: (context, snapshot) {
            final cacheSize = snapshot.data ?? S.of(context).calculating;

            return StreamBuilder(
              stream: _viewModel.hammerShare.stream,
              builder: (context, snapshot) {
                final hammerShare = snapshot.data ?? true;

                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: const ClampingScrollPhysics()),
                  children: <Widget>[
                    // 天气
                    _buildTitle(title: S.of(context).weather),
                    _buildItem(
                      title: S.of(context).shareType,
                      content: hammerShare
                          ? S.of(context).likeHammer
                          : S.of(context).textOnly,
                      onTap: () => _typeDialogFunc(hammerShare: hammerShare),
                    ),

                    // 通用
                    _buildTitle(title: S.of(context).commonUse),
                    _buildItem(
                      title: S.of(context).themeColor,
                      content: getThemeName(),
                      onTap: () {
                        Color selectColor = Theme.of(context).accentColor;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(S.of(context).chooseTheme),
                              content: Container(
                                height: 180,
                                child: BlockPicker(
                                  availableColors: [
                                    AppColor.lapisBlue,
                                    AppColor.paleDogWood,
                                    AppColor.greenery,
                                    AppColor.primroseYellow,
                                    AppColor.flame,
                                    AppColor.islandParadise,
                                    AppColor.kale,
                                    AppColor.pinkYarrow,
                                    AppColor.niagara,
                                  ],
                                  pickerColor: Theme.of(context).accentColor,
                                  onColorChanged: (color) =>
                                      selectColor = color,
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () => pop(context),
                                  child: Text(S.of(context).cancel),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    pop(context);
                                    SharedDepository()
                                        .setThemeColor(selectColor)
                                        .then((_) => EventSendHolder()
                                            .sendEvent(
                                                tag: "themeChange",
                                                event: selectColor));
                                  },
                                  child: Text(S.of(context).certain),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    Container(height: 1, color: AppColor.line2),
                    _buildItem(
                      title: S.of(context).moduleControl,
                      content: S.of(context).openOrCloseModule,
                      onTap: () => push(context, page: SettingModulePage()),
                    ),
                    Container(height: 1, color: AppColor.line2),
                    _buildItem(
                      title: S.of(context).clearCache,
                      content: cacheSize,
                      onTap: () => _viewModel.clearCache(),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  /// 小标题
  Widget _buildTitle({@required String title}) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Text(
        title,
        style: TextStyle(fontSize: 14, color: Theme.of(context).accentColor),
      ),
    );
  }

  /// 每个Item
  Widget _buildItem(
      {@required String title,
      @required String content,
      @required VoidCallback onTap}) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 66,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 16, color: AppColor.text1),
              ),
              Text(
                content,
                style: TextStyle(fontSize: 14, color: AppColor.text2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 获取主题名字
  String getThemeName() {
    final color = Theme.of(context).accentColor;

    if (color == AppColor.lapisBlue) {
      return S.of(context).colorLapisBlue;
    } else if (color == AppColor.paleDogWood) {
      return S.of(context).colorPaleDogWood;
    } else if (color == AppColor.greenery) {
      return S.of(context).colorGreenery;
    } else if (color == AppColor.primroseYellow) {
      return S.of(context).colorPrimroseYellow;
    } else if (color == AppColor.flame) {
      return S.of(context).colorFlame;
    } else if (color == AppColor.islandParadise) {
      return S.of(context).colorIslandParadise;
    } else if (color == AppColor.kale) {
      return S.of(context).colorKale;
    } else if (color == AppColor.pinkYarrow) {
      return S.of(context).colorPinkYarrow;
    } else if (color == AppColor.niagara) {
      return S.of(context).colorNiagara;
    } else {
      return S.of(context).colorNone;
    }
  }

  /// 天气分享形式的弹窗
  void _typeDialogFunc({@required bool hammerShare}) {
    showDiffDialog(
      context,
      contentPadding: const EdgeInsets.only(),
      title: Text("${S.of(context).weather}${S.of(context).shareType}"),
      yesText: S.of(context).close,
      onPressed: () => pop(context),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                _viewModel.setHammerShare(false);
                pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      hammerShare
                          ? Icons.radio_button_unchecked
                          : Icons.radio_button_checked,
                      size: 22,
                      color: SharedDepository().hammerShare
                          ? AppColor.text2
                          : Theme.of(context).accentColor,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 4, top: 6, bottom: 6),
                      child: Text(
                        S.of(context).textOnly,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.text1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                _viewModel.setHammerShare(true);
                pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      hammerShare
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      size: 22,
                      color: SharedDepository().hammerShare
                          ? Theme.of(context).accentColor
                          : AppColor.text2,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 4, top: 6, bottom: 6),
                      child: Text(
                        S.of(context).likeHammer,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.text1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
