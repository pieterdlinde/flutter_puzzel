import 'package:get/get.dart';
import 'package:mypuzzle/pages/landing/landing.page.dart';
import 'package:mypuzzle/pages/puzzel/puzzel.page.dart';

enum AppRoutePaths {
  landing, 
  puzzel
}

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object

  static final routes = [
    GetPage(name: '/', page: () => LandingPage()),
    GetPage(name: '/' + AppRoutePaths.puzzel.toString(), page: () => PuzzelPage()),
  ];
}
