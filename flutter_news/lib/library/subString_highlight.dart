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

  final int termListLength;

  SubstringHighlight({
    @required this.text,
    @required this.term,
    @required this.termListLength,
    this.textStyle = const TextStyle(
      color: Colors.black,
    ),
    this.textStyleHighlight = const TextStyle(
      color: Colors.red,
    ),
  });

  @override
  Widget build(BuildContext context) {
    if (term.isEmpty) {
      return Text(text, style: textStyle);
    } else {
      String termLC = term.toLowerCase();
      List<TextSpan> children = [];
      List<String> spanList = text.toLowerCase().split(termLC);
      int i = 0;
      spanList.forEach((v) {
        // print('v : ' + v);
        if (v.isNotEmpty) {
          children.add(TextSpan(
              text: text.substring(i, i + v.length), style: textStyle));
          i += v.length;
        }
        if (i < text.length) {
          children.add(TextSpan(
              text: text.substring(i, i + term.length),
              style: textStyleHighlight));
          i += term.length;
        }
      });
      return RichText(text: TextSpan(children: children));
    }
  }
}

// List<TextSpan> highlightOccurrences(String source, String query) {
//   if (query == null ||
//       query.isEmpty ||
//       !source.toLowerCase().contains(query.toLowerCase())) {
//     return [TextSpan(text: source)];
//   }
//   RegExp regExp = RegExp(r"((\‘|\'){1}(\S+)?(\s+)*(\S+)?(\’|\'){1})");

//   Iterable<Match> matches = regExp.allMatches(query.toLowerCase());

//   // final matches = query.toLowerCase().allMatches(source.toLowerCase());

//   int lastMatchEnd = 0;

//   final List<TextSpan> children = [];
//   for (var i = 0; i < matches.length; i++) {
//     final match = matches.elementAt(i);

//     if (match.start != lastMatchEnd) {
//       children.add(TextSpan(
//         text: source.substring(lastMatchEnd, match.start),
//       ));
//     }

//     children.add(TextSpan(
//       text: source.substring(match.start, match.end),
//       style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//     ));

//     if (i == matches.length - 1 && match.end != source.length) {
//       children.add(TextSpan(
//         text: source.substring(match.end, source.length),
//       ));
//     }

//     lastMatchEnd = match.end;
//   }
//   return children;
// }
