import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypuzzle/components/tile.component.dart';
import 'package:mypuzzle/constants/app_values.dart';
import 'package:mypuzzle/controllers/tile.controller.dart';

class PuzzelPage extends StatelessWidget {
  const PuzzelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    TileController.to.easy();
                  },
                  child: Text("Easy")),
              ElevatedButton(
                  onPressed: () {
                    TileController.to.medium();
                  },
                  child: Text("Medium")),
              ElevatedButton(
                  onPressed: () {
                    TileController.to.hard();
                  },
                  child: Text("Hard")),
            ],
          ),
          Center(
            child: Obx(() => ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: AppValues.GRID_SIZE_HEIGHT_WIDTH,
                      maxWidth: AppValues.GRID_SIZE_HEIGHT_WIDTH),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: GridView.count(
                      crossAxisCount: TileController.to.currentGridSize,
                      children: List.generate(
                          TileController.to.currentGridSize *
                              TileController.to.currentGridSize, (index) {
                        return Tile(
                          index: index + 1,
                        );
                      }),
                    ),
                  ),
                )),
          ),
        ],
      ),
    ));
  }
}
