import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/equip_models/armor_type_model.dart';
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
  List<WeaponTypeModel> allListsOfWeapons = [];
  bool showOneHanded = false;
  bool showTwoHanded = false;
  bool showDistant = false;
  bool showResetButton = false;
  bool hasDualWeild = false;
  WeaponTypeModel? tempPrimaryWeaponTypeForSwitching;
  WeaponTypeModel? chosenPrimaryWeaponType;
  WeaponTypeModel? tempSecondaryWeaponTypeForSwitching;
  WeaponTypeModel? chosenSecondaryWeaponType;
  WeaponTypeModel? tempEmergencyWeaponTypeForSwitching;
  WeaponTypeModel? chosenEmergencyWeaponType;
  ArmorTypeModel? tempChosenShieldType;
  ArmorTypeModel? chosenShieldType;

  updateShowResetButton() {
    showResetButton = true;
    notifyListeners();
  }

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
    for (var select in allListsOfWeapons) {
      select.isSelected = false;
    }
    chosenPrimaryWeaponType = tempPrimaryWeaponTypeForSwitching;
    tempPrimaryWeaponTypeForSwitching!.isSelected = false;
    closeAllTypeSections();
  }

  updateSecondaryweaponType() {
    for (var select in allListsOfWeapons) {
      select.isSelected = false;
    }
    chosenSecondaryWeaponType = tempSecondaryWeaponTypeForSwitching;
    closeAllTypeSections();
  }

  updateEmergencyweaponType() {
    for (var select in allListsOfWeapons) {
      select.isSelected = false;
    }
    chosenEmergencyWeaponType = tempEmergencyWeaponTypeForSwitching;
    closeAllTypeSections();
  }

  populateAllLists() {
    if (allListsOfWeapons.length < 13) {
      allListsOfWeapons.addAll(listOfEquip.oneHandedTypes);
      allListsOfWeapons.addAll(listOfEquip.twoHandedTypes);
      allListsOfWeapons.addAll(listOfEquip.distanceTypes);
    }
  }

  switchPrimaryWeaponType(WeaponTypeModel type) {
    type.isSelected = !type.isSelected;
    for (var select in allListsOfWeapons) {
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
    for (var select in allListsOfWeapons) {
      select.isSelected = false;
    }
    type.isSelected = !type.isSelected;
    tempSecondaryWeaponTypeForSwitching = type;
    notifyListeners();
  }

  switchEmergencyWeaponType(WeaponTypeModel type) {
    if (chosenEmergencyWeaponType != null) {
      return;
    }
    type.isSelected = !type.isSelected;
    for (var select in allListsOfWeapons) {
      select.isSelected = false;
    }
    type.isSelected = !type.isSelected;
    tempEmergencyWeaponTypeForSwitching = type;
    notifyListeners();
  }

  showDualWeildIntentionCheck(VoidCallback dualWeildCheck) {
    if (listOfEquip.oneHandedTypes.contains(chosenPrimaryWeaponType) &&
        listOfEquip.oneHandedTypes.contains(chosenSecondaryWeaponType)) {
      dualWeildCheck();
    }
  }

  confirmDualWeild(VoidCallback twoCloseCombatWeapons) {
    hasDualWeild = true;
    notifyListeners();
    twoCloseCombatWeapons();
  }

  informImportanceOfVersatileCombat(VoidCallback twoCloseCombatWeapons,
      VoidCallback twoDistantCombatWeapons) {
    bool closeCombatWeapon = listOfEquip.oneHandedTypes
                .contains(chosenPrimaryWeaponType) &&
            listOfEquip.twoHandedTypes.contains(chosenSecondaryWeaponType) ||
        listOfEquip.twoHandedTypes.contains(chosenPrimaryWeaponType) &&
            listOfEquip.oneHandedTypes.contains(chosenSecondaryWeaponType) ||
        // listOfEquip.oneHandedTypes.contains(chosenPrimaryWeaponType) &&
        //     listOfEquip.oneHandedTypes.contains(chosenSecondaryWeaponType) ||
        listOfEquip.twoHandedTypes.contains(chosenPrimaryWeaponType) &&
            listOfEquip.twoHandedTypes.contains(chosenSecondaryWeaponType);
    bool distantCombatWeapon =
        listOfEquip.distanceTypes.contains(chosenPrimaryWeaponType) &&
            listOfEquip.distanceTypes.contains(chosenSecondaryWeaponType);
    if (closeCombatWeapon) {
      twoCloseCombatWeapons();
    } else if (distantCombatWeapon) {
      twoDistantCombatWeapons();
    }
  }

  resetChoices() {
    tempPrimaryWeaponTypeForSwitching = null;
    tempSecondaryWeaponTypeForSwitching = null;
    tempEmergencyWeaponTypeForSwitching = null;
    chosenPrimaryWeaponType = null;
    chosenSecondaryWeaponType = null;
    chosenEmergencyWeaponType = null;
    showResetButton = false;
    hasDualWeild = false;
    closeAllTypeSections();
  }

  switchShieldType(ArmorTypeModel type) {
    type.isSelected = !type.isSelected;
    for (var select in listOfEquip.shieldTypes) {
      select.isSelected = false;
    }
    type.isSelected = !type.isSelected;
    tempChosenShieldType = type;
    notifyListeners();
  }

  updateChosenShield() {
    chosenShieldType = tempChosenShieldType;
    notifyListeners();
  }

  advanceCreationStage() {
    creationStage++;
    notifyListeners();
  }

  retreatCreationStage() {
    creationStage--;
    notifyListeners();
  }

  String? activateNextButton() {
    if (creationStage == 1) {
      advanceCreationStage();
      return null;
    } else if (creationStage == 2) {
      if (chosenEmergencyWeaponType == null) {
        return "You must select all three weapon types first.";
      }
      advanceCreationStage();
      return null;
    } else if (creationStage == 3) {
      if (tempChosenShieldType == null) {
        return "You must select a shild type first.";
      }
      advanceCreationStage();
      updateChosenShield();
    }
    return null;
  }
}
