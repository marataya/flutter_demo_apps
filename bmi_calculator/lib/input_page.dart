import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'IconContent.dart';
import 'ReusableCard.dart';
import 'consts.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender = Gender.male;
  int height = 180;
  int weight = 80;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                      onTapCallback: () =>
                      {
                        setState(() {
                          selectedGender = Gender.male;
                        })
                      },
                      colour: selectedGender == Gender.male
                          ? activeCardColour
                          : inactiveCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    )),
                Expanded(
                    child: ReusableCard(
                      onTapCallback: () =>
                      {
                        setState(() {
                          selectedGender = Gender.female;
                        })
                      },
                      colour: selectedGender == Gender.female
                          ? activeCardColour
                          : inactiveCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    )),
              ],
            )),
        Expanded(
            child: ReusableCard(
                onTapCallback: () => {},
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: textStyle1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: textStyle1,
                        )
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double value) {
                        setState(() {
                          height = value.toInt();
                          print(height);
                        });
                      },
                    )
                  ],
                ))),
        Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                        onTapCallback: () => {},
                        colour: activeCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: textStyle1),
                            Text(weight.toString(), style: numberTextStyle),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressedCallback: () {
                                      setState(() {
                                        weight = weight < 150 ? weight + 1 : weight;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10,),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressedCallback: () {
                                      setState(() {
                                        weight = weight > 10 ? weight-1 : weight;
                                      });
                                    },
                                  )
                                ]),
                          ],
                        ))),
                Expanded(
                    child: ReusableCard(
                        onTapCallback: () => {},
                        colour: activeCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE', style: textStyle1),
                            Text(age.toString(), style: numberTextStyle),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressedCallback: () {
                                      setState(() {
                                        age = age < 150 ? age + 1 : age;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10,),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressedCallback: () {
                                      setState(() {
                                        age = age > 10 ? age-1 : age;
                                      });
                                    },
                                  )
                                ]),
                          ],
                        ))),
              ],
            )),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => ResultsPage()
            ));
          },
          child: Container(
            alignment: Alignment.center,
            child: Text('CALCULATE', style: numberTextStyle),
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {super.key, required this.icon, this.onPressedCallback});

  final IconData icon;
  final VoidCallback? onPressedCallback;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon, size: 33,),
      shape: CircleBorder(),
      fillColor: textColor,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      elevation: 5,
      onPressed: onPressedCallback,
    );
  }
}
