import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';
import 'package:fantasy_name_generator/models/saved_char_models/char_stats_icon_model.dart';
import 'package:fantasy_name_generator/shared/data/saved_char_data/saved_char_data.dart';

class SavedCharController with ChangeNotifier {
  var icons = SavedCharData();
  late CharStatsIconModel tempIcon;
  List<CharStatsIconModel> allIcons = [];

  initializingController() {
    if (allIcons.isEmpty) {
      allIcons = icons.statsIconColumn;
      tempIcon = icons.statsIconColumn.first;
    }
  }

  showDescriptions(int index, dynamic list) {
    for (var i in list) {
      i.isSelected = false;
    }
    list[index].isSelected = true;
    tempIcon = list[index];
    notifyListeners();
  }
}
