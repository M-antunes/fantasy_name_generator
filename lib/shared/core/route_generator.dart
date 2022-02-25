import 'package:fantasy_name_generator/modules/create_or_check_saved/create_or_check_saved_page.dart';
import 'package:fantasy_name_generator/modules/generate_name/generate_name_page.dart';
import 'package:fantasy_name_generator/modules/main_screen/main_screen_page.dart';
import 'package:fantasy_name_generator/modules/saved_names/saved_names_page.dart';
import 'package:fantasy_name_generator/modules/selections/race_selection.dart';
import 'package:fantasy_name_generator/shared/routes/app_roues.dart';
import 'package:flutter/material.dart';

abstract class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.main:
        return MaterialPageRoute(
          builder: (_) => const MainScreenPage(),
          settings: routeSettings,
        );
      case AppRoutes.generateNamePage:
        return MaterialPageRoute(
          builder: (_) => const GenerateNamePage(),
          settings: routeSettings,
        );
      case AppRoutes.savedNames:
        return MaterialPageRoute(
          builder: (_) => const SavedNamesPage(),
          settings: routeSettings,
        );
      case AppRoutes.createOrCheck:
        return MaterialPageRoute(
          builder: (_) => const CreateOrCheckSavedPage(),
          settings: routeSettings,
        );
      case AppRoutes.raceSelection:
        return MaterialPageRoute(
          builder: (_) => const RaceSelection(),
          settings: routeSettings,
        );
      default:
        throw Exception();
    }
  }
}
