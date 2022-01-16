import 'package:flutter/material.dart';

class Tile {
  final int id;
  String displayName;  
  final int position;
  bool isEmptyTile;

  Tile({required this.id, required this.displayName, required this.position, required this.isEmptyTile});
}
