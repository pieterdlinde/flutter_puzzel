import 'package:flutter/material.dart';
import 'package:mypuzzle/controllers/tile.controller.dart';

import 'level.tile.button.dart';

class LevelTiles extends StatelessWidget {
  const LevelTiles({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LevelTileButton(buttonText: "easy", colors: [Colors.lightBlue.shade200,Colors.lightBlue],onPress: (){ TileController.to.easy();},),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LevelTileButton(buttonText: "medium", colors: [Colors.lightGreenAccent,Colors.lightGreen],onPress: (){ TileController.to.medium();},),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LevelTileButton(buttonText: "hard", colors: [Colors.redAccent,Colors.red],onPress: (){ TileController.to.hard();},),
            ),
          ],
        );
  }
}