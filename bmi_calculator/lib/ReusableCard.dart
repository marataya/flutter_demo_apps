import 'package:flutter/cupertino.dart';

/// Reusable card that represents rounded box with given styling
class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;

  ReusableCard(
      {this.colour = const Color(0xff1d1e33), required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(10), color: colour),
      height: 200,
      width: 170,
    );
  }
}
