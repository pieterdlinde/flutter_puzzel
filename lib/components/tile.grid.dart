import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypuzzle/constants/app_values.dart';
import 'package:mypuzzle/controllers/tile.grid.controller.dart';

class TileGrid extends StatelessWidget {
  final int mainBlock;
  const TileGrid({Key? key, required this.mainBlock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: TileGridController.to.currentGridSize,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(
          TileGridController.to.currentGridSize *
              TileGridController.to.currentGridSize, (index) {
        return Obx(() => AnimatedContainer(
              duration:
                  const Duration(milliseconds: AppValues.TILE_CHANGE_SPEED),
              color: TileGridController.to
                      .getTileGrid(index, mainBlock)
                      .value
                      .isFlipped
                  ? Colors.grey.shade50
                  : Colors.transparent,
            ));
      }),
    );
  }
}
