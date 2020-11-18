library substring_highlight;

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

/// Widget that renders a string with sub-string highlighting.
class SubstringHighlight extends StatelessWidget {
  /// The String searched by {SubstringHighlight.term}.
  final String text;

  /// The sub-string that is highlighted inside {SubstringHighlight.text}.
  final String term;

  /// The {TextStyle} of the {SubstringHighlight.text} that isn't highlighted.
  final TextStyle textStyle;

  /// The {TextStyle} of the {SubstringHighlight.term}s found.
  final TextStyle textStyleHighlight;

  SubstringHighlight({
    @required this.text,
    @required this.term,
    this.textStyle = const TextStyle(
      color: Colors.black,
    ),
    this.textStyleHighlight = const TextStyle(
      color: Colors.red,
    ),
  });

  @override
  Widget build(BuildContext context) {
    print('===========================시작===========================');
    if (term.isEmpty) {
      return Text(text, style: textStyle);
    } else {
      print('run SubstringHighlight');
      String termLC = term.toLowerCase();
      List<InlineSpan> children = [];
      // spanList에서 termLC 단어를 text에서 분리한 다음에 그 자리에 쉼표를 대입.
      List<String> spanList = text.toLowerCase().split(termLC);
      // print('spanList');
      // print(spanList);
      int i = 0;
      spanList.forEach((v) {
        print('v : ' + v);
        if (v.isNotEmpty) {
          children.add(TextSpan(
              text: text.substring(i, i + v.length), style: textStyle));
          i += v.length;
          print('first i :' + i.toString());
        }
        if (i < text.length) {
          children.add(TextSpan(
              text: text.substring(i, i + term.length),
              style: textStyleHighlight));
          i += term.length;
          print('second i :' + i.toString());
        }
      });
      return RichText(text: TextSpan(children: children));
    }
  }
}
