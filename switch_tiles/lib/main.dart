import 'package:flutter/material.dart';
import 'package:switch_tiles/StatefullColorfulTile.dart';

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
      Padding(
        key: UniqueKey(),
        padding: const EdgeInsets.all(8.0),
        child: StatefulColorfulTile(),
      ),
      Padding(
        key: UniqueKey(),
        padding: const EdgeInsets.all(8.0),
        child: StatefulColorfulTile(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Row(
            children: tiles,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sentiment_very_satisfied),
          onPressed: swapTiles,
        ),
      ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}
