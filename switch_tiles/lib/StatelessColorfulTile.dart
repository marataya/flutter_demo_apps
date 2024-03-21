import 'package:flutter/material.dart';

import 'UniqueColorGenerator.dart';

class StatelessColorfulTile extends StatelessWidget {
  final Color defaultColor = UniqueColorGenerator().getColor();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Container(
        color: defaultColor,
      ),
    );
  }
}
