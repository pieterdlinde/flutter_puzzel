import 'package:get/get.dart';
import 'package:mypuzzle/constants/app_values.dart';
import 'package:mypuzzle/models/tile.dart';

class TileController extends GetxController {
  static TileController get to => Get.find();

  final tilesMoved = 0.obs;
  int get currentTilesMoved => tilesMoved.value;

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

    for (int i = 0; i < gridSize; i++) {
      var tile = Tile(
          id: i, displayName: i.toString(), position: i, isEmptyTile: false, isFlipped: false);
      if (i == gridSize - 1) {
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
      return true;
    }
    // Check top and bottom
    if (emptyTile.value.id + AppValues.GRID_SIZE == tile.value.id ||
        emptyTile.value.id - AppValues.GRID_SIZE == tile.value.id) {
      return true;
    }

    return false;
  }

  void moveTile(int index) {
    if (canTileMove(index)) {
      var tile = getTile(index);
      var emptyTile = getEmptyTile();

      tile.value.isEmptyTile = true;
      emptyTile.value.isEmptyTile = false;

      emptyTile.value.displayName = tile.value.displayName;
      emptyTile.value.isFlipped = !emptyTile.value.isFlipped;
      tile.value.displayName = "";

      tiles.refresh();
    }
  }

  void shuffleTiles() {
    var changeTilesNumber = 5;

    for (var i = 0; i < changeTilesNumber; i++) {
      for (var _tile in tiles.value) {
        if (canTileMove(_tile.id)) {
          moveTile(_tile.id);
          break;
        }
      }
    }

    for (var i = changeTilesNumber; i > 0; i--) {
      for (var _tile in tiles.reversed) {
        if (canTileMove(_tile.id)) {
          moveTile(_tile.id);
          break;
        }
      }
    }

  }
}
