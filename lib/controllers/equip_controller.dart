import 'dart:math';

import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/equip_models/armor_model.dart';
import 'package:fantasy_name_generator/models/equip_models/off_hand_type_model.dart';
import 'package:fantasy_name_generator/models/equip_models/weapon_model.dart';
import 'package:fantasy_name_generator/shared/data/default_char_model_data.dart';
import 'package:flutter/cupertino.dart';

import '../models/equip_models/armor_type_model.dart';
import '../models/equip_models/weapon_type_model.dart';
import '../shared/data/class_data.dart';
import '../shared/data/equip_data.dart';

class EquipController extends ChangeNotifier {
  CharModel char = DefaultCharModelData().defaultCharModel;
  int creationStage = 7;
  var listOfClasses = ClassData();
  var listOfEquip = EquipData();
  Random randomIndex = Random();

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
  bool equipGenerated = false;
  bool penaltyToDexApplied = false;

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

  updateArmorType() {
    chosenArmorType = tempArmorType;
    tempArmorType!.isSelected = false;
    hasChosenArmor = true;
    notifyListeners();
  }

  updateOffHandType() {
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
      if (chosenPrimaryWeaponType!.wielding == "One-handed" &&
          chosenSecondaryWeaponType!.wielding == "One-handed") {
        confirmDualWield();
      }
    }
    hasChosenSecondaryWeapon = true;
    notifyListeners();
  }

  switchPrimaryWeaponType(WeaponFamilyModel type) {
    for (var select in allListsOfWeaponsFamily) {
      select.isSelected = false;
    }
    type.isSelected = !type.isSelected;
    tempPrimaryWeaponType = type;
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
    chosenArmorType = null;
    tempPrimaryWeaponType = null;
    chosenPrimaryWeaponType = null;
    tempSecondaryWeaponType = null;
    chosenSecondaryWeaponType = null;
    tempOffHandType = null;
    chosenOffHandType = null;
    chosenShieldType = null;
    hasChosenArmor = false;
    hasChosenPrimaryWeapon = false;
    hasChosenSecondaryWeapon = false;
    hasChosenShield = false;
    isDualWield = false;
    displayTwoHandedIcon = false;
    cantChooseTwoHandedAnymore = false;
    readyToChoseShield = false;
    equipGenerated = false;
    for (var select in filteredOffHandTypes) {
      select.isSelected = false;
    }
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
        filteredShieldTypes =
            filterShield(listOfEquip.shieldTypesForOffHand, "Empty", "", "");
        notifyListeners();
        break;
      case "Aristocrat":
        filteredArmorTypes =
            filterEquip(listOfEquip.armorTypes, "No armor", "", "");
        filteredShieldTypes =
            filterShield(listOfEquip.shieldTypesForOffHand, "Empty", "", "");
        notifyListeners();
        break;
      case "Commoner":
        filteredArmorTypes =
            filterEquip(listOfEquip.armorTypes, "No armor", "", "");
        filteredShieldTypes =
            filterShield(listOfEquip.shieldTypesForOffHand, "Empty", "", "");
        notifyListeners();
        break;
      case "Noble":
        filteredArmorTypes =
            filterEquip(listOfEquip.armorTypes, "No armor", "", "");
        filteredShieldTypes =
            filterShield(listOfEquip.shieldTypesForOffHand, "Empty", "", "");
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

  //=======================================================================================

  // weapon generation

  generateEquip() {
    calculatingAC();
    generateWeapon();
    generateEmercengyWeapon();
    calculateAttackAndDamage(chosenPrimaryWeaponType!, true, false, false);
    if (chosenSecondaryWeaponType != null) {
      calculateAttackAndDamage(chosenSecondaryWeaponType!, false, true, false);
    }
    calculateAttackAndDamage(
        char.charEquip.emergencyWeapon!.type!, false, false, true);
    equipGenerated = !equipGenerated;
    notifyListeners();
  }

  generateWeapon() {
    WeaponModel weapon;
    List<WeaponModel> list = listOfEquip.allWeapons
        .where((element) =>
            element.type!.wielding == chosenPrimaryWeaponType!.wielding &&
            element.type!.name == chosenPrimaryWeaponType!.name)
        .toList();
    var randomWeapon = randomIndex.nextInt(list.length);
    while (randomWeapon == list.length) {
      randomWeapon = randomIndex.nextInt(list.length);
    }
    weapon = list[randomWeapon];
    char.charEquip.primaryWeapon = weapon;
    if (chosenSecondaryWeaponType != null) {
      if (chosenPrimaryWeaponType!.name == chosenSecondaryWeaponType!.name) {
        char.charEquip.secondaryWeapon = char.charEquip.primaryWeapon!;
        notifyListeners();
        return;
      }
      WeaponModel weapon;
      List<WeaponModel> list = listOfEquip.allWeapons
          .where((element) =>
              element.type!.wielding == chosenSecondaryWeaponType!.wielding &&
              element.type!.name == chosenPrimaryWeaponType!.name)
          .toList();
      var randomWeapon = randomIndex.nextInt(list.length);
      while (randomWeapon == list.length) {
        randomWeapon = randomIndex.nextInt(list.length);
      }
      weapon = list[randomWeapon];
      char.charEquip.secondaryWeapon = weapon;
    }
    notifyListeners();
  }

  generateEmercengyWeapon() {
    if (listOfEquip.distanceTypes
        .any((element) => element == chosenPrimaryWeaponType)) {
      WeaponModel weapon;
      List<WeaponModel> list = listOfEquip.allWeapons
          .where((element) => element.type!.wielding == "One-handed")
          .toList();
      var randomWeapon = randomIndex.nextInt(list.length);
      while (randomWeapon == list.length) {
        randomWeapon = randomIndex.nextInt(list.length);
      }
      weapon = list[randomWeapon];
      char.charEquip.emergencyWeapon = weapon;
    } else {
      WeaponModel weapon;
      List<WeaponModel> list = listOfEquip.allWeapons
          .where((element) => element.type!.wielding == "Range")
          .toList();
      var randomWeapon = randomIndex.nextInt(list.length);
      while (randomWeapon == list.length) {
        randomWeapon = randomIndex.nextInt(list.length);
      }
      weapon = list[randomWeapon];
      char.charEquip.emergencyWeapon = weapon;
    }
    char.combatStats.emergencyAttack = "";
    char.combatStats.emergencyDamage = "";
    notifyListeners();
  }

  calculateAttackAndDamage(WeaponFamilyModel weaponModel, bool primary,
      bool secondary, bool emergency) {
    var attack = 0;
    var attackToString = "";
    var damageToString = char.modAtributes.strength;
    if (listOfEquip.oneHandedTypes
            .any((element) => element.wielding == weaponModel.wielding) ||
        listOfEquip.twoHandedTypes
            .any((element) => element.wielding == weaponModel.wielding)) {
      attack = char.modAtributes.strength! + char.combatStats.baseAttackBonus!;
    } else {
      attack = char.modAtributes.dexterity! + char.combatStats.baseAttackBonus!;
    }
    if (char.combatStats.baseAttackBonus! < 6) {
      attackToString = "+$attack";
    } else if (char.combatStats.baseAttackBonus! > 5 &&
        char.combatStats.baseAttackBonus! < 11) {
      attackToString = "+$attack / +${(attack - 5)}";
    } else if (char.combatStats.baseAttackBonus! > 10 &&
        char.combatStats.baseAttackBonus! < 16) {
      attackToString = "+$attack / +${(attack - 5)} / +${(attack - 10)}";
    } else {
      attackToString =
          "+$attack / +${(attack - 5)} / +${(attack - 10)} / +${(attack - 15)}";
    }
    if (primary) {
      char.combatStats.primaryAttack = attackToString;
      char.combatStats.primaryDamage = damageToString! < 0
          ? "${char.charEquip.primaryWeapon!.damage} $damageToString"
          : "${char.charEquip.primaryWeapon!.damage} + $damageToString";
    } else if (secondary) {
      char.combatStats.secundaryAttack = attackToString;
      char.combatStats.secundaryDamage = damageToString! < 0
          ? "${char.charEquip.secondaryWeapon!.damage} $damageToString"
          : "${char.charEquip.secondaryWeapon!.damage} + $damageToString";
    } else if (emergency) {
      char.combatStats.emergencyAttack = attackToString;
      char.combatStats.emergencyDamage = damageToString! < 0
          ? "${char.charEquip.emergencyWeapon!.damage} $damageToString"
          : "${char.charEquip.emergencyWeapon!.damage} + $damageToString";
    }
    notifyListeners();
  }

  resetEquipStats() {
    char.modAtributes.dexterity =
        ((char.baseAtributes.dexterity! - 10) / 2).floor();
    char.combatStats.armourClass = char.modAtributes.dexterity! + 10;
    char.combatStats.armourSurprise = 10;
    char.combatStats.armourTouch = char.modAtributes.dexterity! + 10;
    equipGenerated = !equipGenerated;
    penaltyToDexApplied = false;
    notifyListeners();
  }

  bool checkIFCharHasArmor() {
    ArmorModel armor;
    List<ArmorModel> armorList = listOfEquip.allArmors
        .where((element) => element.type == chosenArmorType)
        .toList();
    if (armorList.isNotEmpty) {
      var randomArmor = randomIndex.nextInt(armorList.length);
      if (randomArmor == armorList.length) {
        randomArmor--;
      }
      armor = armorList[randomArmor];
      char.charEquip.armour = armor;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool checkIFCharHasShield() {
    if (chosenShieldType == null) {
      return false;
    }
    ArmorModel shield;
    List<ArmorModel> shieldList = listOfEquip.allShields
        .where((element) => element.type!.name == chosenShieldType!.name)
        .toList();
    if (shieldList.isNotEmpty) {
      var randomShield = randomIndex.nextInt(shieldList.length);
      if (randomShield == shieldList.length) {
        randomShield--;
      }
      shield = shieldList[randomShield];
      char.charEquip.shield = shield;
      notifyListeners();
      return true;
    }
    return false;
  }

  calculatingAC() {
    if (checkIFCharHasArmor()) {
      var newAC = 0;
      // Applies penalty for armor to dexterity
      if (char.modAtributes.dexterity! >
          char.charEquip.armour!.maxDexAllowed!) {
        char.modAtributes.dexterity = char.charEquip.armour!.maxDexAllowed!;
        penaltyToDexApplied = true;
      }
      newAC = char.modAtributes.dexterity! +
          10 +
          char.charEquip.armour!.defenseBonus!;
      char.combatStats.armourClass = newAC;
      char.combatStats.armourSurprise = newAC - char.modAtributes.dexterity!;
      char.combatStats.armourTouch =
          newAC - char.charEquip.armour!.defenseBonus!;
      notifyListeners();
    }
    if (checkIFCharHasShield()) {
      char.combatStats.armourClass =
          char.combatStats.armourClass! + char.charEquip.shield!.defenseBonus!;
      char.combatStats.armourSurprise = char.combatStats.armourSurprise! +
          char.charEquip.shield!.defenseBonus!;
      notifyListeners();
    }
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
    if (creationStage == 7) {
      populateListsOfWeaponFamily();
      // populateListsOfArmorFamily();
      filterArmorToClass();
      advanceCreationStage();
      return null;
    } else if (creationStage == 8) {
      if (!hasChosenArmor) {
        return "You need to select all equipment before advancing";
      }
      advanceCreationStage();
    } else if (creationStage == 9) {
      if (!equipGenerated) {
        return "You need to have basic combat gear selected to advance";
      } else {
        advanceCreationStage();
        return null;
      }
    }
    return null;
  }
}
