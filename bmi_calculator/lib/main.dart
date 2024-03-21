import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      seedColor: Color(0xff0a0e21),
    );

    final myTheme = ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: Color(0xff0a0e21),
      textTheme: TextTheme(
        bodyMedium:  TextStyle(color: Colors.white),
      ),
    );

    final myTheme1 = ThemeData.dark().copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: Color(0xff0a0e21),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.secondary
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
      ),
      iconTheme: IconThemeData(
        size: 80,
        color: Color(0xfff3f6ff)
      )
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: myTheme1,
      home: const InputPage(),
    );
  }
}

