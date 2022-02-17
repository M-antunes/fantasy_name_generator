import 'package:fantasy_name_generator/modules/home/home_page.dart';
import 'package:fantasy_name_generator/modules/saved_names/saved_names_page.dart';
import 'package:fantasy_name_generator/shared/routes/app_roues.dart';
import 'package:flutter/material.dart';

abstract class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: routeSettings,
        );
      case AppRoutes.savedNames:
        return MaterialPageRoute(
          builder: (_) => const SavedNamesPage(),
          settings: routeSettings,
        );

      default:
        throw Exception();
    }
  }
}
