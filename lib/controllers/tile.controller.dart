import 'dart:math';

import 'package:get/get.dart';
import 'package:mypuzzle/constants/app_values.dart';
import 'package:mypuzzle/models/level.dart';
import 'package:mypuzzle/models/tile.dart';

class TileController extends GetxController {
  static TileController get to => Get.find();

  final tilesMoved = 0.obs;
  int get currentTilesMoved => tilesMoved.value;

  final gridSize = AppValues.GRID_SIZE.obs;
  int get currentGridSize => gridSize.value;

  final level = Level.easy.obs;
  Level get currentlevel => level.value;

  RxList<Tile> tiles = RxList<Tile>();

  @override
  void onReady() async {
    generateTiles();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updatedMoves() {
    tilesMoved.value += 1;
  }

  Rx<Tile> getTile(int index) {
    return tiles.value.where((tile) => tile.position == index).first.obs;
  }

  Rx<Tile> getEmptyTile() {
    return tiles.value.where((tile) => tile.isEmptyTile == true).first.obs;
  }

  List<Tile> generateTiles() {
    tiles = RxList<Tile>();

    var gridSize = AppValues.GRID_SIZE * AppValues.GRID_SIZE;

    for (int i = 1; i <= gridSize; i++) {
      var tile = Tile(
          id: i,
          displayName: i.toString(),
          position: i,
          isEmptyTile: false,
          isFlipped: true);
      if (i == gridSize) {
        tile.displayName = "";
        tile.isEmptyTile = true;
      }
      tiles.add(tile);
    }

    return tiles;
  }

  bool canTileMove(int index) {
    var tile = getTile(index);
    // Check empty tile
    if (tile.value.isEmptyTile) {
      return false;
    }

    var emptyTile = getEmptyTile();

    // Check left and right
    if (emptyTile.value.id + 1 == tile.value.id ||
        emptyTile.value.id - 1 == tile.value.id) {
      // if(emptyTile.value.id % AppValues.GRID_SIZE == 0){

      // }else{
      return true;
      // }
    }
    // Check top and bottom
    if (emptyTile.value.id + AppValues.GRID_SIZE == tile.value.id ||
        emptyTile.value.id - AppValues.GRID_SIZE == tile.value.id) {
      return true;
    }

    return false;
  }

  Future<void> moveTile(int index) async {
    if (canTileMove(index)) {
      var tile = getTile(index);
      var emptyTile = getEmptyTile();
      var displayName = tile.value.displayName;

      tile.value.isEmptyTile = true;
      tile.value.displayName = "";

      // tiles.refresh();
      // await Future.delayed(const Duration(milliseconds: AppValues.TILE_CHANGE_SPEED), (){});

      emptyTile.value.isEmptyTile = false;
      emptyTile.value.displayName = displayName;
      emptyTile.value.isFlipped = !tile.value.isFlipped;

      tiles.refresh();
    }
  }

  Future<void> shuffleTiles() async {
    var rng = new Random();
    var changeTilesNumber = rng.nextInt(AppValues.GRID_SIZE) + 3;

    for (var i = 0; i < changeTilesNumber; i++) {
      for (var _tile in tiles.value) {
        if (canTileMove(_tile.id)) {
          moveTile(_tile.id);
          await Future.delayed(const Duration(milliseconds: 150), () {});
          break;
        }
      }
    }

    changeTilesNumber = rng.nextInt(AppValues.GRID_SIZE) + 4;
    for (var i = changeTilesNumber; i > 0; i--) {
      for (var _tile in tiles.reversed) {
        if (canTileMove(_tile.id)) {
          moveTile(_tile.id);
          await Future.delayed(const Duration(milliseconds: 150), () {});
          break;
        }
      }
    }

    changeTilesNumber = rng.nextInt(AppValues.GRID_SIZE);
    for (var i = 0; i < changeTilesNumber; i++) {
      for (var _tile in tiles.value) {
        if (canTileMove(_tile.id)) {
          moveTile(_tile.id);
          await Future.delayed(const Duration(milliseconds: 150), () {});
          break;
        }
      }
    }
  }

  String getImage(String imageName) {
    var imageNr = int.parse(imageName);
    if (level.value == Level.easy) {      
      return ('assets/easy/0' + imageName.toString() + ".jpg");
    }
    if (level.value == Level.medium) {
      return ('assets/medium/0' + imageName + ".png");
    }
    if (level.value == Level.hard) {
      return ('assets/hard/0' + imageName + ".png");
    }

    return imageName;
  }

  Future<void> easy() async {
    level.value = Level.easy;
    AppValues.GRID_SIZE = 3;
    gridSize.value = AppValues.GRID_SIZE;
    generateTiles();
    gridSize.refresh();
    await Future.delayed(const Duration(milliseconds: 550), () {});
    await shuffleTiles();
    await shuffleTiles();
  }

  Future<void> medium() async {
    level.value = Level.medium;
    AppValues.GRID_SIZE = 4;
    gridSize.value = AppValues.GRID_SIZE;
    generateTiles();
    gridSize.refresh();
    await Future.delayed(const Duration(milliseconds: 550), () {});
    await shuffleTiles();
    await shuffleTiles();
  }

  Future<void> hard() async {
    level.value = Level.hard;
    AppValues.GRID_SIZE = 5;
    gridSize.value = AppValues.GRID_SIZE;
    generateTiles();
    gridSize.refresh();
    await Future.delayed(const Duration(milliseconds: 550), () {});
    await shuffleTiles();
    await shuffleTiles();
  }
}
