import 'package:flutter/cupertino.dart';

/// Reusable card that represents rounded box with given styling
class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onTapCallback;
  ReusableCard(
      {required this.colour, this.cardChild, this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), color: colour),
        height: 200,
        width: double.infinity,
      ),
    );
  }
}
