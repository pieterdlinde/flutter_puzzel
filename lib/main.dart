import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypuzzle/controllers/tile.controller.dart';

import 'constants/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put<TileController>(TileController());
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // locale: languageController.getLocale, // <- Current locale
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: "/",
      getPages: AppRoutes.routes,
    );
  }
}
