import 'package:flutter/material.dart';
import 'package:mypuzzle/components/tile.component.dart';
import 'package:mypuzzle/constants/app_values.dart';
import 'package:mypuzzle/controllers/tile.controller.dart';

class PuzzelPage extends StatelessWidget {

  final int gridSize;
  const PuzzelPage({ Key? key, required this.gridSize }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          ElevatedButton(onPressed: (){
            TileController.to.shuffleTiles();
          }, child: Text("Shuffle")),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: AppValues.GRID_SIZE_HEIGHT_WIDTH,maxWidth: AppValues.GRID_SIZE_HEIGHT_WIDTH),
              child: GridView.count(
                crossAxisCount: gridSize,
                children: List.generate(gridSize * gridSize, (index) {
                  return Tile(index: index + 1,);
                }),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
