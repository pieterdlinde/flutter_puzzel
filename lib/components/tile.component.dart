import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypuzzle/constants/app_values.dart';
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
      child: Obx(() => AnimatedContainer(
            duration: const Duration(milliseconds: AppValues.TILE_CHANGE_SPEED),
            decoration: BoxDecoration(
              color: tileController.getTile(index).value.isEmptyTile
                  ? Colors.white
                  : Colors.lightBlue,
              borderRadius: BorderRadius.circular(0),
            ),
            child: Center(child: TextOrImage(index)),
          )),
    );
  }

  Widget TextOrImage(int index) {
    var tileController = TileController.to;
    var tile = tileController.getTile(index).value;
    if (tile.isFlipped && !tile.isEmptyTile) {
      // return Text("Image");
      return Container(
        child: Image(
          height: 1000,
          width: 1000,
          fit: BoxFit.fitWidth,
          image: AssetImage(
              TileController.to.getImage(tile.displayName.toString())),
        ),
      );
    }
    return Text(tile.displayName);
  }
}
