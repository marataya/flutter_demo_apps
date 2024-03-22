import 'dart:math';

class CalculatorCore {
  final int height;
  final int weight;
  double _bmi = 0;

  CalculatorCore(this.height, this.weight);

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 29) {
      return 'Obese';
    } else if (_bmi > 25) {
      return 'Overweight';
    } else if (_bmi > 18) {
      return 'Normal';
    } else return 'Underweight';
  }
}
