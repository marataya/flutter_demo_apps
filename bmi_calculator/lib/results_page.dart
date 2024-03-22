import 'package:bmi_calculator/ReusableCard.dart';
import 'package:bmi_calculator/consts.dart';
import 'package:flutter/material.dart';

import 'BottomButton.dart';
import 'input_page.dart';


class ResultsPage extends StatelessWidget {
  final String bmi;
  final String textResult;

  ResultsPage({super.key, required this.bmi, required this.textResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Your Result',
                  style: bigassTextStyle,
                ),
              )),
          Expanded(
              flex: 4,
              child: ReusableCard(
                colour: activeCardColour,
                cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        textResult.toUpperCase(),
                        style: resultTextStyle,
                      ),
                      Text(bmi, style: kBMITextStyle),
                    ]),
              )),
          BottomButton(
            onTapCallback: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RECALCULATE',
          )
        ],
      ),
    );
  }
}
