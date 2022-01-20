import 'package:flutter/material.dart';
import 'package:mypuzzle/helpers/shado-box.dart';

class LevelTileButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPress;
  final List<Color> colors;
  
  const LevelTileButton({ Key? key, required this.buttonText, required this.onPress, required this.colors }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shadoview(
      child: GestureDetector(
                onTap: onPress,
                child: Container(
                  width: 80,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: colors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, 
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
    );
  }
}