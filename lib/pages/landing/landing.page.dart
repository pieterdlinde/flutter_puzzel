import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypuzzle/constants/app_routes.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text("Go to next page"),
            onPressed: () {
              Get.offAndToNamed(AppRoutePaths.puzzel.toString());
            },
          ),
        ));
  }
}
