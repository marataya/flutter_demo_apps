import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'consts.dart';
import 'input_page.dart';

void main() => runApp(const BMICalculator());

// var myTheme = ThemeData(
//   colorScheme: ColorScheme.fromSeed(
//       seedColor: Color(0xff0a0e21),
//   ),
//   appBarTheme: AppBarTheme(
//     backgroundColor: Color(0xff0a0e21)
//   ),
//   textTheme: GoogleFonts.codaTextTheme(),
// );

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      brightness: MediaQuery.platformBrightnessOf(context),
      seedColor: seedColor,
    );

    final myTheme = ThemeData.dark().copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: inactiveCardColour,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: colorScheme.secondary),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: activeCardColour,
        foregroundColor: Colors.white
      ),
      iconTheme: IconThemeData(size: 80, color: Color(0xfff3f6ff)),
      textTheme: TextTheme(
          titleLarge: const TextStyle(fontSize: 24, color: Colors.white)),
      sliderTheme: SliderThemeData(
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15)
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: inactiveCardColour,
      )
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: myTheme,
      home: Scaffold(
        appBar: AppBar(
          // foregroundColor: Theme.of(context).colorScheme.onError,
          // backgroundColor: Theme.of(context).colorScheme.onBackground,
          centerTitle: true,
          title: Text(
            'BMI CALCULATOR',
            // style: TextStyle(color: Colors.white),
          ),
        ),
        body: InputPage(),
      ),
    );
  }
}
