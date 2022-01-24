import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypuzzle/constants/app_values.dart';
import 'package:mypuzzle/controllers/tile.controller.dart';
import 'package:mypuzzle/controllers/tile.grid.controller.dart';
import 'package:mypuzzle/helpers/shado-box.dart';
import 'package:mypuzzle/models/tile.dart' as tileModel;

import 'tile.grid.dart';

class Tile extends StatelessWidget {
  final int index;

  const Tile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tileController = TileController.to;
    var tileGridController = TileGridController.to;

    return GestureDetector(
      onTap: () {
        tileController.moveTile(index);
        tileController.updatedMoves();
      },
      child: Obx(() => AnimatedContainer(
            duration: const Duration(milliseconds: AppValues.TILE_CHANGE_SPEED),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(child: TextOrImage(index)),
                TileGrid(
                  mainBlock: index,
                )
              ],
            ),
          )),
    );
  }

  Widget TextOrImage(int index) {
    var tileController = TileController.to;
    var tile = tileController.getTile(index).value;
    if (tile.isFlipped && !tile.isEmptyTile) {
      // return Text("Image");
      return Shadoview(
        child: Image(
          height: 500,
          width: 500,
          fit: BoxFit.fitWidth,
          image: AssetImage(
              TileController.to.getImage(tile.displayName.toString())),
        ),
      );
    }
    return EmptyTileView(
      tileController: tileController,
      index: index,
      displayName: tile.displayName,
    );
  }
}

class EmptyTileView extends StatelessWidget {
  const EmptyTileView({
    Key? key,
    required this.tileController,
    required this.index,
    required this.displayName,
  }) : super(key: key);

  final TileController tileController;
  final int index;
  final String displayName;

  @override
  Widget build(BuildContext context) {
    return Shadoview(
      child: Container(
        decoration: BoxDecoration(
            gradient: tileController.getTile(index).value.isEmptyTile
                ? LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                        Colors.grey.shade50,
                      ])
                : const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                        Colors.lightBlueAccent,
                        Colors.lightBlueAccent,
                        Colors.lightBlue
                      ])),
        child: Center(
            child: Text(
          displayName,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
