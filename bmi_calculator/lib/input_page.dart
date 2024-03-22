import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'IconContent.dart';
import 'ReusableCard.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColour = Color(0xffeb1555);
const activeCardColour = Color(0xff1d1e33);
const inactiveCardColour = Color(0xff111328);

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
  Color maleCardColor = inactiveCardColour;
  Color femaleCardColor = inactiveCardColour;
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: ReusableCard(
              onTapCallback: () => {setState(() {
                selectedGender = Gender.male;
              })},
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
              onTapCallback: () => {setState(() {
                selectedGender = Gender.female;
              })},
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
                cardChild: null)),
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: ReusableCard(
                    onTapCallback: () => {},
                    colour: activeCardColour,
                    cardChild: null)),
            Expanded(
                child: ReusableCard(
                    onTapCallback: () => {},
                    colour: activeCardColour,
                    cardChild: null)),
          ],
        )),
        Container(
          color: bottomContainerColour,
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: bottomContainerHeight,
        )
      ],
    );
  }
}
