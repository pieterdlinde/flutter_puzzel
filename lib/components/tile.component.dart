import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypuzzle/controllers/tile.controller.dart';

class Tile extends StatelessWidget {
  final int index;
  const Tile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tileController = TileController.to;

    return GestureDetector(
        onTap: () {
          tileController.moveTile(index);
          tileController.updatedMoves();
        },
        child: Obx(
          () => Container(
              color: tileController.getTile(index).value.isEmptyTile
                  ? Colors.white
                  : Colors.lightBlue,
              child: Center(
                  child: Text(tileController.getTile(index).value.displayName +
                      tileController
                          .getTile(index)
                          .value
                          .isFlipped
                          .toString()))),
        ));
  }
}
