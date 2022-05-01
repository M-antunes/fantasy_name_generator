import 'package:fantasy_name_generator/models/class_models/traits_model.dart';

import '../../../../../../../models/equip_models/equip_model.dart';
import '../../../../../../../shared/data/feat_data/all_feats_data.dart';
import '../../../../../../../shared/data/feat_data/readied_combat_feats_data.dart';

class FeatsController {
  var classFeatList = ReariedCombatFeatsData();
  var allFeats = AllFeatsData();

  getFeats(String physicalStyle, int level, String className, String raceName,
      EquipModel equip, String physical) {
    List<TraitModel> charFeats = [];
    switch (physicalStyle) {
      case "Berserker":
        charFeats = calculateFeats(classFeatList.berserkerFeats,
            allFeats.combatFeats, level, className, raceName, equip, physical);
        break;
      case "Dual-wielder":
        charFeats = calculateFeats(classFeatList.dualWielderFeat,
            allFeats.combatFeats, level, className, raceName, equip, physical);
        break;
      case "Soldier":
        charFeats = calculateFeats(classFeatList.soldierFeats,
            allFeats.combatFeats, level, className, raceName, equip, physical);
        break;
      case "Bowman":
        charFeats = calculateFeats(classFeatList.bowmanFeats,
            allFeats.combatFeats, level, className, raceName, equip, physical);
        break;
      case "Marksman":
        charFeats = calculateFeats(classFeatList.marksmanFeats,
            allFeats.combatFeats, level, className, raceName, equip, physical);
        break;
      case "Knifeman":
        charFeats = calculateFeats(classFeatList.knifemanFeats,
            allFeats.combatFeats, level, className, raceName, equip, physical);
        break;
      case "Swordsman":
        charFeats = calculateFeats(classFeatList.swordsmanFeat,
            allFeats.combatFeats, level, className, raceName, equip, physical);
        break;
      case "Martial":
        charFeats = calculateFeats(classFeatList.martialFeats,
            allFeats.combatFeats, level, className, raceName, equip, physical);
        break;
      case "Thrower":
        charFeats = calculateFeats(classFeatList.soldierFeats,
            allFeats.combatFeats, level, className, raceName, equip, physical);
        break;
      default:
    }
    return charFeats;
  }

  calculateFeats(List<TraitModel> list, List<TraitModel> allFeats, int level,
      String className, String raceName, EquipModel equip, String physical) {
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
    if (className == "Monk") {
      for (var i = 4; i < level; i += 4) {
        numberOfFeats++;
      }
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
      charFeats.insert(0, filteredFeats[0]);
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
      charFeats = filteredFeats;
    }
    charFeats = addingInformationToFeat(charFeats, equip, level, physical);
    return charFeats;
  }

  List<TraitModel> addingInformationToFeat(List<TraitModel> charFeats,
      EquipModel equip, int level, String physical) {
    List<TraitModel> weaponFeats = [];
    weaponFeats = charFeats
        .where((element) =>
            element.traiName == "Weapon Focus" ||
            element.traiName == "Weapon Specialization" ||
            element.traiName == "Greater Weapon Focus" ||
            element.traiName == "Greater Weapon Specialization" ||
            element.traiName == "Weapon Finesse")
        .toList();
    for (var i = 0; i < weaponFeats.length; i++) {
      TraitModel? newTrait;
      var alteredTrait = weaponFeats[i];
      if (physical == "Bowman" ||
          physical == "Marksman" ||
          physical == "Thrower") {
        newTrait = alteredTrait.copyWith(
            traiName:
                "${alteredTrait.traiName} (${equip.rangeWeapon!.type!.name})");
      } else {
        newTrait = alteredTrait.copyWith(
            traiName:
                "${alteredTrait.traiName} (${equip.meleeWeapon!.type!.name})");
      }
      charFeats.removeWhere(
          (element) => element.traiName.contains(alteredTrait.traiName));
      charFeats.add(newTrait);
    }
    charFeats.sort((a, b) => a.levelAcquired.compareTo(b.levelAcquired));
    return charFeats;
  }
}
