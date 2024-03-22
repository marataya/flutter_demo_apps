import 'package:flutter/cupertino.dart';

import 'consts.dart';

class BottomButton extends StatelessWidget {

  final VoidCallback onTapCallback;
  final String buttonTitle;

  BottomButton({required this.onTapCallback, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Container(
        alignment: Alignment.center,
        child: Text(buttonTitle, style: bigassTextStyle),
        color: bottomContainerColour,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}
