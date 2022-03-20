import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/equip_models/off_hand_type_model.dart';
import 'package:fantasy_name_generator/shared/data/default_char_model_data.dart';
import 'package:flutter/cupertino.dart';

import '../models/equip_models/armor_type_model.dart';
import '../models/equip_models/weapon_type_model.dart';
import '../shared/data/class_data.dart';
import '../shared/data/equip_data.dart';

class EquipController extends ChangeNotifier {
  CharModel char = DefaultCharModelData().defaultCharModel;
  int creationStage = 1;
  var listOfClasses = ClassData();
  var listOfEquip = EquipData();
  List<WeaponFamilyModel> allListsOfWeaponsFamily = [];
  List<ArmorFamilyModel> allListsOfArmorFamily = [];
  List<ArmorFamilyModel> allListsOfShieldFamily = [];
  List<ArmorFamilyModel> filteredArmorTypes = [];
  List<OffHandTypeModel> filteredShieldTypes = [];
  List<OffHandTypeModel> filteredOffHandTypes = [];

  WeaponFamilyModel? chosenPrimaryWeaponType;
  WeaponFamilyModel? tempPrimaryWeaponType;
  WeaponFamilyModel? chosenSecondaryWeaponType;
  WeaponFamilyModel? tempSecondaryWeaponType;

  ArmorFamilyModel? tempShieldType;
  ArmorFamilyModel? chosenShieldType;
  ArmorFamilyModel? tempArmorType;
  ArmorFamilyModel? chosenArmorType;

  OffHandTypeModel? tempOffHandType;
  OffHandTypeModel? chosenOffHandType;

  bool hasChosenPrimaryWeapon = false;
  bool hasChosenSecondaryWeapon = false;
  bool hasChosenArmor = false;
  bool hasChosenShield = false;
  bool isDualWield = false;
  bool displayTwoHandedIcon = false;
  bool cantChooseTwoHandedAnymore = false;
  bool readyToChoseShield = false;

  populateListsOfWeaponFamily() {
    if (allListsOfWeaponsFamily.isNotEmpty) {
      return;
    }
    List<WeaponFamilyModel> tempList = [];
    tempList.addAll(listOfEquip.oneHandedTypes);
    tempList.addAll(listOfEquip.twoHandedTypes);
    tempList.addAll(listOfEquip.distanceTypes);
    allListsOfWeaponsFamily = tempList;
    notifyListeners();
  }

  confirmDualWield() {
    isDualWield = true;
    notifyListeners();
  }

  confirmTwoHanded() {
    cantChooseTwoHandedAnymore = true;
    notifyListeners();
  }

  updatePrimaryweaponType() {
    chosenPrimaryWeaponType = tempPrimaryWeaponType;
    tempPrimaryWeaponType!.isSelected = false;
    hasChosenPrimaryWeapon = true;
    readyToChoseShield = true;
    if (chosenPrimaryWeaponType!.wielding == "Two-handed" ||
        chosenPrimaryWeaponType!.wielding == "Range") {
      chosenSecondaryWeaponType = chosenPrimaryWeaponType;
      displayTwoHandedIcon = true;
      hasChosenSecondaryWeapon = true;
    }
    cantChooseTwoHandedAnymore = true;
    notifyListeners();
  }

  updateSecondaryweaponType(Future<dynamic> dualWieldCheck) {
    chosenSecondaryWeaponType = tempSecondaryWeaponType;
    tempSecondaryWeaponType!.isSelected = false;
    hasChosenSecondaryWeapon = true;
    notifyListeners();
    if (chosenPrimaryWeaponType!.wielding == "One-handed" &&
        chosenSecondaryWeaponType!.wielding == "One-handed") {
      dualWieldCheck;
    }
  }

  updateArmorType() {
    chosenArmorType = tempArmorType;
    tempArmorType!.isSelected = false;
    hasChosenArmor = true;
    notifyListeners();
  }

  updateOffHandType(VoidCallback dualWieldCheck) {
    chosenOffHandType = tempOffHandType;
    hasChosenShield = true;
    bool hasShield = listOfEquip.shieldTypesForOffHand
        .any((element) => element == chosenOffHandType);
    if (hasShield) {
      chosenShieldType = ArmorFamilyModel(
          name: chosenOffHandType!.name,
          isSelected: true,
          picture: chosenOffHandType!.picture);
    } else {
      chosenSecondaryWeaponType = WeaponFamilyModel(
          name: chosenOffHandType!.name,
          isSelected: true,
          picture: chosenOffHandType!.picture,
          wielding: "One-handed");
      // if (chosenPrimaryWeaponType!.wielding == "One-handed" &&
      //     chosenSecondaryWeaponType!.wielding == "One-handed") {
      dualWieldCheck;
      // }
    }
    hasChosenSecondaryWeapon = true;
    notifyListeners();
  }

  switchBothWeapons(WeaponFamilyModel type) {
    if (chosenPrimaryWeaponType == null) {
      switchPrimaryWeaponType(type);
    } else {
      switchSecondaryWeaponType(type);
    }
  }

  switchPrimaryWeaponType(WeaponFamilyModel type) {
    for (var select in allListsOfWeaponsFamily) {
      select.isSelected = false;
    }
    type.isSelected = !type.isSelected;
    tempPrimaryWeaponType = type;
    notifyListeners();
  }

  switchSecondaryWeaponType(WeaponFamilyModel type) {
    for (var select in allListsOfWeaponsFamily) {
      select.isSelected = false;
    }
    type.isSelected = !type.isSelected;
    tempSecondaryWeaponType = type;
    notifyListeners();
  }

  switchOffHandWeaponType(OffHandTypeModel type) {
    for (var select in filteredOffHandTypes) {
      select.isSelected = false;
    }
    type.isSelected = !type.isSelected;
    tempOffHandType = type;
    notifyListeners();
  }

  switchArmorType(ArmorFamilyModel type) {
    for (var select in filteredArmorTypes) {
      select.isSelected = false;
    }
    type.isSelected = true;
    tempArmorType = type;
    notifyListeners();
  }

  switchShieldType(ArmorFamilyModel type) {
    for (var select in filteredShieldTypes) {
      select.isSelected = false;
    }
    type.isSelected = !type.isSelected;
    tempShieldType = type;
    notifyListeners();
  }

  resetChoices() {
    tempArmorType = null;
    tempShieldType = null;
    // tempPrimaryWeaponType!.isSelected = false;
    tempPrimaryWeaponType = null;
    tempSecondaryWeaponType = null;
    chosenArmorType = null;
    chosenPrimaryWeaponType = null;
    chosenSecondaryWeaponType = null;
    chosenShieldType = null;
    // tempOffHandType!.isSelected = false;
    tempOffHandType = null;
    chosenOffHandType = null;
    hasChosenArmor = false;
    hasChosenPrimaryWeapon = false;
    hasChosenSecondaryWeapon = false;
    hasChosenShield = false;
    isDualWield = false;
    displayTwoHandedIcon = false;
    cantChooseTwoHandedAnymore = false;
    readyToChoseShield = false;
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

  filterShield(
    List<OffHandTypeModel> list,
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
    if (filteredArmorTypes.isNotEmpty) {
      return;
    }
    switch (char.charClass.name) {
      case "Barbarian":
        filteredArmorTypes =
            filterEquip(listOfEquip.armorTypes, "No armor", "Light", "Medium");
        filteredShieldTypes = listOfEquip.shieldTypesForOffHand;

        notifyListeners();
        break;
      case "Ranger":
        filteredArmorTypes =
            filterEquip(listOfEquip.armorTypes, "No armor", "Light", "Medium");
        filteredShieldTypes = listOfEquip.shieldTypesForOffHand;

        notifyListeners();
        break;
      case "Druid":
        filteredArmorTypes =
            filterEquip(listOfEquip.armorTypes, "No armor", "Light", "Medium");
        filteredShieldTypes = listOfEquip.shieldTypesForOffHand;

        notifyListeners();
        break;
      case "Summoner":
        filteredArmorTypes =
            filterEquip(listOfEquip.armorTypes, "No armor", "Light", "Medium");
        filteredShieldTypes =
            filterShield(listOfEquip.shieldTypesForOffHand, "Empty", "", "");
        notifyListeners();
        break;
      case "Alchemist":
        filteredArmorTypes =
            filterEquip(listOfEquip.armorTypes, "No armor", "Light", "");
        filteredShieldTypes =
            filterShield(listOfEquip.shieldTypesForOffHand, "Empty", "", "");
        notifyListeners();
        break;
      case "Monk":
        filteredArmorTypes =
            filterEquip(listOfEquip.armorTypes, "No armor", "", "");
        filteredShieldTypes =
            filterShield(listOfEquip.shieldTypesForOffHand, "Empty", "", "");
        notifyListeners();
        break;
      case "Rogue":
        filteredArmorTypes =
            filterEquip(listOfEquip.armorTypes, "No armor", "Light", "");
        filteredShieldTypes =
            filterShield(listOfEquip.shieldTypesForOffHand, "Empty", "", "");
        notifyListeners();
        break;
      case "Bard":
        filteredArmorTypes =
            filterEquip(listOfEquip.armorTypes, "No armor", "Light", "");
        filteredShieldTypes = listOfEquip.shieldTypesForOffHand;

        notifyListeners();
        break;
      case "Sorcerer":
        filteredArmorTypes =
            filterEquip(listOfEquip.armorTypes, "No armor", "", "");
        filteredShieldTypes =
            filterShield(listOfEquip.shieldTypesForOffHand, "Empty", "", "");
        notifyListeners();
        break;
      case "Wizard":
        filteredArmorTypes =
            filterEquip(listOfEquip.armorTypes, "No armor", "", "");
        filteredShieldTypes = filterShield(
            listOfEquip.shieldTypesForOffHand, "No shield", "", "");
        notifyListeners();
        break;
      default:
        filteredArmorTypes = listOfEquip.armorTypes;
        filteredShieldTypes = listOfEquip.shieldTypesForOffHand;
        notifyListeners();
    }
    filteredOffHandTypes.addAll(listOfEquip.oneHandedTypeForOffHand);
    filteredOffHandTypes.addAll(filteredShieldTypes);
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
      populateListsOfWeaponFamily();
      // populateListsOfArmorFamily();
      filterArmorToClass();
      advanceCreationStage();
      return null;
    }
    if (creationStage == 2) {
      if (!hasChosenShield) {
        return "You need to select all equipment before advancing";
      }
    }
    return null;
  }
}
