import 'package:flutter/material.dart';

class ReusableCard extends StatefulWidget {
  ReusableCard({@required this.colorVal, this.cardChild});

  // colorVal 자체가 Color Widget
  // final은 한번 생성되면 변하지 않음
  // 우리가 생성한 위젯은 StatelessWidget이므로 변수 앞에 final을 붙여줘야햠.
  final Color colorVal;
  final Widget cardChild;

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Container는 하나의 child를 가질 수 있는데 그걸 변수로 만들어서 외부에서 Customize가 가능하게 만듦
      child: widget.cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: widget.colorVal,
      ),
    );
  }
}