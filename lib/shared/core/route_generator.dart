import 'package:fantasy_name_generator/modules/create_or_check_saved/create_or_check_saved_page.dart';
import 'package:fantasy_name_generator/modules/main_screens/char_development_page.dart';
import 'package:fantasy_name_generator/modules/main_screens/equip_development_page.dart';
import 'package:fantasy_name_generator/shared/routes/app_roues.dart';
import 'package:flutter/material.dart';

abstract class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.main:
        return MaterialPageRoute(
          builder: (_) => const CharDevelopmentPage(),
          settings: routeSettings,
        );

      case AppRoutes.equipPage:
        return MaterialPageRoute(
          builder: (_) => const EquipDevelopMentPage(),
          settings: routeSettings,
        );
      case AppRoutes.createOrCheck:
        return MaterialPageRoute(
          builder: (_) => const CreateOrCheckSavedPage(),
          settings: routeSettings,
        );
      default:
        throw Exception();
    }
  }
}
