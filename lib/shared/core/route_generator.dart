import 'package:fantasy_name_generator/modules/home/pages/home_page.dart';
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

      default:
        throw Exception();
    }
  }
}
