import 'package:flutter/material.dart';

import 'StatelessColorfulTile.dart';

void main() => runApp(const PositionedTiles());

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({super.key});

  @override
  State<PositionedTiles> createState() => _PositionedTilesState();
}

class _PositionedTilesState extends State<PositionedTiles> {
  // This widget is the root of your application.
  late List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    tiles = [
      StatelessColorfulTile(),
      StatelessColorfulTile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sentiment_very_satisfied),
        onPressed: swapTiles,
      ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}
