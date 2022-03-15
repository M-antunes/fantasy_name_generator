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
  List<WeaponFamilyModel> allListsOfWeapons = [];
  List<ArmorFamilyModel> filteredArmors = [];
  List<ArmorFamilyModel> filteredShields = [];
  bool showOneHanded = false;
  bool showTwoHanded = false;
  bool showDistant = false;
  bool showResetButton = false;
  bool hasDualWeild = false;
  WeaponFamilyModel? tempPrimaryWeaponTypeForSwitching;
  WeaponFamilyModel? chosenPrimaryWeaponType;
  WeaponFamilyModel? tempSecondaryWeaponTypeForSwitching;
  WeaponFamilyModel? chosenSecondaryWeaponType;
  WeaponFamilyModel? tempEmergencyWeaponTypeForSwitching;
  WeaponFamilyModel? chosenEmergencyWeaponType;
  ArmorFamilyModel? tempChosenShieldType;
  ArmorFamilyModel? chosenShieldType;
  ArmorFamilyModel? tempChosenArmorType;
  ArmorFamilyModel? chosenArmorType;

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

  switchPrimaryWeaponType(WeaponFamilyModel type) {
    type.isSelected = !type.isSelected;
    for (var select in allListsOfWeapons) {
      select.isSelected = false;
    }
    type.isSelected = !type.isSelected;
    tempPrimaryWeaponTypeForSwitching = type;
    notifyListeners();
  }

  switchSecondaryWeaponType(WeaponFamilyModel type) {
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

  switchEmergencyWeaponType(WeaponFamilyModel type) {
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

// Armor section =========================================================================

  switchShieldType(ArmorFamilyModel type) {
    type.isSelected = !type.isSelected;
    for (var select in listOfEquip.shieldTypes) {
      select.isSelected = false;
    }
    type.isSelected = !type.isSelected;
    tempChosenShieldType = type;
    notifyListeners();
  }

  switchArmorType(ArmorFamilyModel type) {
    type.isSelected = !type.isSelected;
    for (var select in listOfEquip.armorTypes) {
      select.isSelected = false;
    }
    type.isSelected = !type.isSelected;
    tempChosenArmorType = type;
    notifyListeners();
  }

  updateChosenShield() {
    chosenShieldType = tempChosenShieldType;
    notifyListeners();
  }

  chooseNoShieldAuto() {
    var zeroShield = listOfEquip.shieldTypes[0];
    tempChosenShieldType = zeroShield;
    tempChosenShieldType!.isSelected = true;
    chosenShieldType = tempChosenShieldType;
    notifyListeners();
  }

  undoNoshield() {
    tempChosenShieldType!.isSelected = false;
    notifyListeners();
  }

  filterEquip(
    List<ArmorFamilyModel> list,
    String permited1,
    String permited2,
    String permited3,
  ) {
    return list
        .where((type) =>
            type.name == permited1 ||
            type.name == permited2 ||
            type.name == permited3)
        .toList();
  }

  filterArmorToClass() {
    switch (char.charClass.name) {
      case "Barbarian":
        filteredArmors = filterEquip(
            listOfEquip.armorTypes, "No armor", "Light armor", "Medium armor");
        notifyListeners();
        break;
      case "Ranger":
        filteredArmors = filterEquip(
            listOfEquip.armorTypes, "No armor", "Light armor", "Medium armor");
        notifyListeners();
        break;
      case "Druid":
        filteredArmors = filterEquip(
            listOfEquip.armorTypes, "No armor", "Light armor", "Medium armor");
        notifyListeners();
        break;
      case "Summoner":
        filteredArmors = filterEquip(
            listOfEquip.armorTypes, "No armor", "Light armor", "Medium armor");
        filteredShields =
            filterEquip(listOfEquip.shieldTypes, "No shield", "", "");
        notifyListeners();
        break;
      case "Alchemist":
        filteredArmors =
            filterEquip(listOfEquip.armorTypes, "No armor", "Light armor", "");
        filteredShields =
            filterEquip(listOfEquip.shieldTypes, "No shield", "", "");
        notifyListeners();
        break;
      case "Monk":
        filteredArmors =
            filterEquip(listOfEquip.armorTypes, "No armor", "", "");
        filteredShields =
            filterEquip(listOfEquip.shieldTypes, "No shield", "", "");
        notifyListeners();
        break;
      case "Rogue":
        filteredArmors =
            filterEquip(listOfEquip.armorTypes, "No armor", "Light armor", "");
        filteredShields =
            filterEquip(listOfEquip.shieldTypes, "No shield", "", "");
        notifyListeners();
        break;
      case "Bard":
        filteredArmors =
            filterEquip(listOfEquip.armorTypes, "No armor", "Light armor", "");
        notifyListeners();
        break;
      case "Sorcerer":
        filteredArmors =
            filterEquip(listOfEquip.armorTypes, "No armor", "", "");
        filteredShields =
            filterEquip(listOfEquip.shieldTypes, "No shield", "", "");
        notifyListeners();
        break;
      case "Wizard":
        filteredArmors =
            filterEquip(listOfEquip.armorTypes, "No armor", "", "");
        filteredShields =
            filterEquip(listOfEquip.shieldTypes, "No shield", "", "");
        notifyListeners();
        break;
      default:
        filteredArmors = listOfEquip.armorTypes;
        filteredShields = listOfEquip.shieldTypes;
        notifyListeners();
    }
  }

  updateChosenArmor() {
    chosenArmorType = tempChosenArmorType;
    notifyListeners();
  }
  // Move on with the selections ===========================================================

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
      filterArmorToClass();
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
    } else if (creationStage == 4) {
      if (tempChosenArmorType == null) {
        return "You must select an armor type first.";
      }
      advanceCreationStage();
      updateChosenArmor();
    }
    return null;
  }
}
