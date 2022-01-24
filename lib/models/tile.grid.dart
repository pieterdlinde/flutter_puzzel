import 'package:flutter/material.dart';

class TileGrid {
  final int id;
  final int mainBlock;
  bool isOpposite;
  bool isFlipped;

  TileGrid({required this.id, required this.isFlipped, required this.isOpposite, required this.mainBlock});
}
