import 'package:flutter/material.dart';

class LevelTileButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPress;
  final List<Color> colors;
  
  const LevelTileButton({ Key? key, required this.buttonText, required this.onPress, required this.colors }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: onPress,
              child: Container(
                margin: EdgeInsets.only(bottom: 10.0, left: 15.0),
                width: 120,
                height: 50,
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
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
  }
}