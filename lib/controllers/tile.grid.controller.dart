import 'dart:math';

import 'package:get/get.dart';
import 'package:mypuzzle/constants/app_values.dart';
import 'package:mypuzzle/models/animations.enum.dart';
import 'package:mypuzzle/models/level.dart';
import 'package:mypuzzle/models/tile.grid.dart';

class TileGridController extends GetxController {
  static TileGridController get to => Get.find();

  final tilesMoved = 0.obs;
  int get currentTilesMoved => tilesMoved.value;

  final gridSize = AppValues.TILE_GRID_SIZE.obs;
  int get currentGridSize => gridSize.value;

  RxList<TileGrid> tiles = RxList<TileGrid>();

  @override
  void onReady() async {
    generateTiles();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Rx<TileGrid> getTileGrid(int index, int mainBlock) {
    return tiles.value
        .where(
            (element) => element.id == index && element.mainBlock == mainBlock)
        .first
        .obs;
  }

  List<TileGrid> generateTiles() {
    tiles = RxList<TileGrid>();

    var tileGridSize = AppValues.TILE_GRID_SIZE * AppValues.TILE_GRID_SIZE;
    var gridSize = AppValues.GRID_SIZE * AppValues.GRID_SIZE;

    for (var mb = 1; mb <= gridSize; mb++) {
      for (int i = 0; i <= tileGridSize; i++) {
        var tile =
            TileGrid(id: i, isFlipped: false, isOpposite: false, mainBlock: mb);
        if (mb == gridSize) {
          tile.isFlipped = true;
        }
        tiles.add(tile);
      }
    }

    return tiles;
  }

  Future<void> moveTile(
    int index,
    int speed,
  ) async {
    var rng = new Random();

    var _tiles = tiles.value.where((t) => t.mainBlock == index).toList();
    if (rng.nextBool()) {
      for (var tile in _tiles) {
        tile.isFlipped = !tile.isFlipped;
        await Future.delayed(Duration(microseconds: speed), () {});
        tiles.refresh();
      }
    } else if (rng.nextBool()) {
      for (var tile in _tiles.reversed) {
        tile.isFlipped = !tile.isFlipped;
        await Future.delayed(Duration(microseconds: speed), () {});
        tiles.refresh();
      }
    } else if (rng.nextBool()) {
      for (var tile in _tiles.reversed) {
        tile.isFlipped = !tile.isFlipped;
        await Future.delayed(Duration(microseconds: speed), () {});
        tiles.refresh();
      }
    } else {
      for (var tile in _tiles.reversed) {
        tile.isFlipped = !tile.isFlipped;
        await Future.delayed(Duration(microseconds: speed), () {});
        tiles.refresh();
      }
    }
  }

  void refreshLevel() {
    generateTiles();
    tiles.refresh();
  }
}
