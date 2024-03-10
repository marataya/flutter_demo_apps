import 'package:audioplayers/audioplayers.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  final player = AudioPlayer();

  void playsound(String audioPath) async {
    await player.stop();
    await player.play(AssetSource(audioPath));
  }

  Expanded buildKey(String sound) {
    Match? match = RegExp(r'\d+').firstMatch(sound);
    int number = match != null ? int.parse(match!.group(0)!) : 0;
    print(number);
    Color? color = null;
    switch(number) {
      case 1: color = Colors.orange;
      case 2: color = Colors.green;
      case 3: color = Colors.blue;
      case 4: color = Colors.purple;
      case 5: color = Colors.pink;
      case 6: color = Colors.cyan;
      case 7: color = Colors.brown;
    }
    return Expanded(
      child: TextButton(
        child: Text(''),
        onPressed: () async => playsound(sound),
        style: TextButton.styleFrom(
            backgroundColor: color,
            shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.purpleAccent,
            title: const Text('Motherfucking App'),
            centerTitle: true,
            elevation: 2,
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DogName(nouns.first),
                const SizedBox(
                  height: 8,
                ),
                buildKey('note1.wav'),
                buildKey('note2.wav'),
                buildKey('note3.wav'),
                buildKey('note4.wav'),
                buildKey('note5.wav'),
                buildKey('note6.wav'),
                buildKey('note7.wav'),
              ],
            ),
          ),
        ));
  }
}

class DogName extends StatelessWidget {
  final String name;

  const DogName(this.name);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.lightBlueAccent),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Text(
          name,
          style: TextStyle(fontSize: 25, color: Colors.black54),
        ),
      ),
    );
  }
}
