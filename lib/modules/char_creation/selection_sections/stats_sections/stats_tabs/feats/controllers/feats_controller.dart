import 'package:fantasy_name_generator/models/class_models/traits_model.dart';

import '../../../../../../../shared/data/combat_style_feats_data/all_feats_data.dart';
import '../../../../../../../shared/data/combat_style_feats_data/readied_feats_data.dart';

class FeatsController {
  var classFeatList = ReariedFeatsData();
  var allFeats = AllFeatsData();

  getFeats(String physicalStyle, int level, String className, String raceName) {
    List<TraitModel> charFeats = [];
    switch (physicalStyle) {
      case "Berserker":
        charFeats = calculateFeats(classFeatList.berserkerFeats,
            allFeats.combatFeats, level, className, raceName);
        break;
      case "Dual-wielder":
        charFeats = calculateFeats(classFeatList.dualWielderFeat,
            allFeats.combatFeats, level, className, raceName);
        break;
      case "Soldier":
        charFeats = calculateFeats(classFeatList.soldierFeats,
            allFeats.combatFeats, level, className, raceName);
        break;
      case "Bowman":
        charFeats = calculateFeats(classFeatList.bowmanFeats,
            allFeats.combatFeats, level, className, raceName);
        break;
      case "Marksman":
        charFeats = calculateFeats(classFeatList.marksmanFeats,
            allFeats.combatFeats, level, className, raceName);
        break;
      case "Knifeman":
        charFeats = calculateFeats(classFeatList.knifemanFeats,
            allFeats.combatFeats, level, className, raceName);
        break;
      case "Swordsman":
        charFeats = calculateFeats(classFeatList.swordsmanFeat,
            allFeats.combatFeats, level, className, raceName);
        break;
      case "Martial":
        charFeats = calculateFeats(classFeatList.martialFeats,
            allFeats.combatFeats, level, className, raceName);
        break;
      case "Thrower":
        charFeats = calculateFeats(classFeatList.soldierFeats,
            allFeats.combatFeats, level, className, raceName);
        break;
      default:
    }
    return charFeats;
  }

  calculateFeats(List<TraitModel> list, List<TraitModel> allFeats, int level,
      String className, String raceName) {
    List<TraitModel> charFeats = [];
    List<TraitModel> feats = list;
    var numberOfFeats =
        level % 2 != 0 ? ((level + 1) / 2).floor() : (level / 2).floor();
    if (className == "Warrior") {
      numberOfFeats = level;
    }
    if (raceName == "Human") {
      numberOfFeats++;
    }
    List<TraitModel> filteredFeats = [];
    filteredFeats.insert(0, AllFeatsData().reactionary);
    if (feats.length > numberOfFeats) {
      for (var i = 0; i < numberOfFeats; i++) {
        filteredFeats.add(feats[i]);
      }
      charFeats = filteredFeats;
    } else if (feats.length == numberOfFeats) {
      charFeats.addAll(feats);
    } else {
      filteredFeats.addAll(feats);
      var featsLeft = numberOfFeats - feats.length;
      for (var i = 0; i < featsLeft; i++) {
        allFeats.shuffle();
        var newItem = allFeats.firstWhere((element) =>
            !filteredFeats.contains(element) &&
            (element.fitFor.contains("all") ||
                element.fitFor.contains(className)));
        filteredFeats.add(newItem);
      }
    }
    charFeats = filteredFeats;
    return charFeats;
  }
}
