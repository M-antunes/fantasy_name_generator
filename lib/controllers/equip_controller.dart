import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/key_value.model.dart';
import 'package:fantasy_name_generator/shared/data/default_char_model_data.dart';
import 'package:flutter/cupertino.dart';

import '../models/equip_models/weapon_type_model.dart';
import '../shared/data/class_data.dart';
import '../shared/data/equip_data.dart';

class EquipController extends ChangeNotifier {
  CharModel char = DefaultCharModelData().defaultCharModel;
  int creationStage = 1;
  var listOfClasses = ClassData();
  var listOfEquip = EquipData();
  List<WeaponTypeModel> allListsPrimary = [];
  List<WeaponTypeModel> allListsSecondary = [];
  String fightStyle = "";
  String tempFightStyle = "";
  bool showOneHanded = false;
  bool showTwoHanded = false;
  bool showDistant = false;
  WeaponTypeModel? tempPrimaryWeaponTypeForSwitching;
  WeaponTypeModel? chosenPrimaryWeaponType;
  WeaponTypeModel? tempSecondaryWeaponTypeForSwitching;
  WeaponTypeModel? chosenSecondaryWeaponType;

  makeWeaponSegmentTrue(String show) {
    switch (show) {
      case "One-handed":
        showOneHanded = makeTheRestOfWeaponSegmentFalse(showOneHanded);
        notifyListeners();
        break;
      case "Two-handed":
        showTwoHanded = makeTheRestOfWeaponSegmentFalse(showTwoHanded);
        notifyListeners();
        break;
      case "Distant":
        showDistant = makeTheRestOfWeaponSegmentFalse(showDistant);
        notifyListeners();
        break;
      default:
    }
  }

  closeAllTypeSections() {
    showOneHanded = false;
    showTwoHanded = false;
    showDistant = false;
    notifyListeners();
  }

  bool makeTheRestOfWeaponSegmentFalse(bool safe) {
    closeAllTypeSections();
    if (safe) {
      safe = false;
    } else {
      safe = true;
    }
    return safe;
  }

  updatePrimaryweaponType() {
    for (var select in allListsPrimary) {
      select.isSelected = false;
    }
    chosenPrimaryWeaponType = tempPrimaryWeaponTypeForSwitching;
    tempPrimaryWeaponTypeForSwitching!.isSelected = false;
    closeAllTypeSections();
  }

  updateSecondaryweaponType() {
    for (var select in allListsPrimary) {
      select.isSelected = false;
    }
    chosenSecondaryWeaponType = tempSecondaryWeaponTypeForSwitching;
    closeAllTypeSections();
  }

  populateAllLists() {
    if (allListsPrimary.length < 13) {
      allListsPrimary.addAll(listOfEquip.oneHandedTypes);
      allListsPrimary.addAll(listOfEquip.twoHandedTypes);
      allListsPrimary.addAll(listOfEquip.distanceTypes);
    }
  }

  switchPrimaryWeaponType(WeaponTypeModel type) {
    type.isSelected = !type.isSelected;
    for (var select in allListsPrimary) {
      select.isSelected = false;
    }
    type.isSelected = !type.isSelected;
    tempPrimaryWeaponTypeForSwitching = type;
    notifyListeners();
  }

  switchSecondaryWeaponType(WeaponTypeModel type) {
    if (chosenSecondaryWeaponType != null) {
      return;
    }
    type.isSelected = !type.isSelected;
    for (var select in allListsPrimary) {
      select.isSelected = false;
    }
    type.isSelected = !type.isSelected;
    tempSecondaryWeaponTypeForSwitching = type;
    notifyListeners();
  }

  resetChoices() {
    tempPrimaryWeaponTypeForSwitching = null;
    tempSecondaryWeaponTypeForSwitching = null;
    chosenPrimaryWeaponType = null;
    chosenSecondaryWeaponType = null;
    closeAllTypeSections();
  }

  advanceCreationStage() {
    creationStage++;
    notifyListeners();
  }

  retreatCreationStage() {
    creationStage--;
    notifyListeners();
  }

  updateCombatStyle() {
    fightStyle = tempFightStyle;
    notifyListeners();
  }

  switchCombatStyle(KeyValueModel combatStyle) {
    listOfClasses.fightingStyle[0].value.key = false;
    listOfClasses.fightingStyle[1].value.key = false;
    combatStyle.value.key = !combatStyle.value.key;
    tempFightStyle = combatStyle.key;
    notifyListeners();
  }

  String? activateNextButton() {
    if (creationStage == 1) {
      advanceCreationStage();
      updateSecondaryweaponType();
      return null;
    }
    return null;
  }
}
