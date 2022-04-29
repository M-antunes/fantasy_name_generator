import '../../../../../../../models/class_models/specials_model.dart';
import '../../../../../../../models/class_models/traits_model.dart';
import '../../../../../../../models/equip_models/equip_model.dart';
import '../../../../../../../shared/data/class_data/class_traits_data/barbarian/barbarian_traits_data.dart';
import '../../../../../../../shared/data/class_data/class_traits_data/warrior/warrior_traits_data.dart';
import '../../../../../../../shared/utils/utils.dart';

class FeaturesController {
  var barbarian = BarbarianTraitsData();
  var warrior = WarriorTraitsData();

  List<TraitModel> gettingClassTraits(
      String className, int level, EquipModel equip) {
    List<TraitModel> traitList = [];
    switch (className) {
      case "Barbarian":
        traitList = gettingTraits(level, barbarian.barbarianTraits, equip);
        traitList.sort((a, b) => a.levelAcquired.compareTo(b.levelAcquired));
        break;
      case "Warrior":
        traitList = gettingTraits(level, warrior.warriorTraits, equip);
        traitList = addingInformationToTrait(
            traitList, equip, level, "Weapon training");
        traitList.sort((a, b) => a.levelAcquired.compareTo(b.levelAcquired));
        break;
      default:
    }
    return traitList;
  }

  List<TraitModel> gettingTraits(
      int level, List<TraitModel> charTraits, EquipModel equip) {
    List<TraitModel> newList = [];
    var valueList = [];
    List<TraitModel> replacementList = [];
    List<TraitModel> list =
        charTraits.where((element) => element.levelAcquired <= level).toList();
    var onlyVariableTraits =
        list.where((element) => element.multiplier != null).toList();
    list.removeWhere((element) => element.multiplier != null);
    for (var i in onlyVariableTraits) {
      var changableValue = level - i.levelAcquired;
      if (i.levelAcquired == level) {
        changableValue++;
      }
      changableValue = (changableValue / i.multiplier!).floor();
      valueList.add(changableValue);
    }
    var index = 0;
    for (var i in onlyVariableTraits) {
      var newString = "${i.traiName} ${valueList[index] + 1}";
      var newTrait = TraitModel(
          traiName: newString,
          levelAcquired: i.levelAcquired,
          traiDescription: i.traiDescription,
          isSelected: i.isSelected);
      newList.add(newTrait);
      index++;
    }
    replacementList.addAll(list);
    replacementList.addAll(newList);
    return replacementList;
  }

  List<TraitModel> addingInformationToTrait(List<TraitModel> charTraits,
      EquipModel equip, int level, String traitName) {
    if (!charTraits.any((element) => element.traiName.contains(traitName))) {
      return charTraits;
    }
    TraitModel? newTrait;
    var alteredTrait = charTraits
        .firstWhere((element) => element.traiName.contains(traitName));
    if (level > 4 && level < 9) {
      newTrait = alteredTrait.copyWith(
          traiName:
              "${alteredTrait.traiName} (${equip.meleeWeapon!.type!.name})");
    } else if (level > 8) {
      newTrait = alteredTrait.copyWith(
          traiName:
              "${alteredTrait.traiName}  (${equip.meleeWeapon!.type!.name}) - (${equip.rangeWeapon!.type!.name})");
    }
    charTraits.removeWhere((element) => element.traiName.contains(traitName));
    charTraits.add(newTrait!);
    return charTraits;
  }

  List<SpecialsModel> gettingClassSpecials(
      String className, int level, String race) {
    List<SpecialsModel> specials = [];
    switch (className) {
      case "Barbarian":
        specials = gettingBarbarianRagePowers(level, race);
        break;
      default:
    }
    return specials;
  }

  List<SpecialsModel> gettingBarbarianRagePowers(int level, String race) {
    var numberOfSpecial = (level / 2).floor();
    List<SpecialsModel> cloneList = barbarian.ragePowers
        .where((element) => element.levelAcquired <= level)
        .toList();
    if (race == "Human" || race == "Hafling") {
      cloneList.removeWhere((element) =>
          element.name == "Night Vision" && element.name == "Low-light Vision");
    }
    if (race == "Orc" || race != "Dwarf" || race != "Half-orc") {
      cloneList.removeWhere((element) => element.name == "Night Vision");
    }
    List<SpecialsModel> specialList = [];
    for (var i = 0; i < numberOfSpecial; i++) {
      var random = generateRandom(cloneList.length);

      specialList.add(cloneList[random]);
      cloneList.remove(cloneList[random]);
    }
    return specialList;
  }
}
