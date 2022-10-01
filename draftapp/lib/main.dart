import 'package:flutter/material.dart';
import 'screens/game_environment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: GameEnvironment(),
      )
    );
  }
}


// Stack(
// alignment: AlignmentDirectional.center,
// children: <Widget>[
// Positioned(
// top: 5,
// left: 5,
// child: Container(
// // height: 120,
// // width: 120,
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: AssetImage('assets/polarBear.png')
// ),
// ),
// ),
// )
// ],
// )

// Expanded(
// child: Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage('assets/polarBear.png')
// )
// ),
// ),
// ),