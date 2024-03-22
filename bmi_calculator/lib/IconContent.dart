import 'package:bmi_calculator/consts.dart';
import 'package:flutter/cupertino.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconContent({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
            style: textStyle1,
        )
      ],
    );
  }
}
