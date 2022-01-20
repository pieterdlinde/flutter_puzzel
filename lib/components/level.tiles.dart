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
            LevelTileButton(buttonText: "easy", colors: [Colors.lightBlue,Colors.lightBlue.shade200],onPress: (){ TileController.to.easy();},),
            LevelTileButton(buttonText: "medium", colors: [Colors.purple,Colors.purple.shade200],onPress: (){ TileController.to.medium();},),
            LevelTileButton(buttonText: "hard", colors: [Colors.deepOrange,Colors.deepOrange.shade200],onPress: (){ TileController.to.hard();},),
          ],
        );
  }
}