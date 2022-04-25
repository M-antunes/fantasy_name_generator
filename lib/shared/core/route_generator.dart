import 'package:fantasy_name_generator/modules/char_creation/selection_sections/stats_sections/stats_tabs/magic_gear/widgets/spell_and_potion_description.dart';
import 'package:fantasy_name_generator/modules/create_or_check_saved/create_or_check_saved_page.dart';
import 'package:fantasy_name_generator/modules/saved_chars/saved_char_sheet/saved_chars_sheet.dart';
import 'package:fantasy_name_generator/shared/routes/app_roues.dart';
import 'package:flutter/material.dart';

import '../../modules/char_creation/main_screens/char_development_page.dart';
import '../../modules/char_creation/selection_sections/stats_sections/loading_page/loading_page.dart';
import '../../modules/saved_chars/saved_char_selection/saved_char_selection.dart';

abstract class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.charSection:
        return MaterialPageRoute(
          builder: (_) => const CharDevelopmentPage(),
          settings: routeSettings,
        );
      case AppRoutes.createOrCheck:
        return MaterialPageRoute(
          builder: (_) => const CreateOrCheckSavedPage(),
          settings: routeSettings,
        );
      case AppRoutes.loading:
        return MaterialPageRoute(
          builder: (_) => const LoadingPage(),
          settings: routeSettings,
        );
      case AppRoutes.savedCharSheet:
        return MaterialPageRoute(
          builder: (_) => const SavedCharSheet(),
          settings: routeSettings,
        );
      case AppRoutes.savedCharSelection:
        return MaterialPageRoute(
          builder: (_) => const SavedCharSelection(),
          settings: routeSettings,
        );

      default:
        throw Exception();
    }
  }
}
