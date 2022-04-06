import 'dart:math';

import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/equip_models/armor_model.dart';
import 'package:fantasy_name_generator/models/equip_models/weapon_model.dart';
import 'package:fantasy_name_generator/models/physical_style_model.dart';
import 'package:fantasy_name_generator/shared/data/class_data.dart';
import 'package:fantasy_name_generator/shared/data/equip_data.dart';
import 'package:flutter/cupertino.dart';

import '../models/equip_models/enchant_model.dart';
import '../models/equip_models/wonderous_items_model.dart';
import '../shared/data/enchant_data.dart';
import '../shared/data/wonderous_items_data.dart';

class StatsController with ChangeNotifier {
  late CharModel char;
  var listOfWonderousItems = WonderousItemsData();
  Random randomIndex = Random();
  var listOfEnchants = EnchantData();
  var equip = EquipData();
  var classData = ClassData();
  WeaponModel meleeWeapon = WeaponModel(forbiddenTo: []);
  WeaponModel rangeWeapon = WeaponModel(forbiddenTo: []);

  final List<String> itemsLabel = [
    "Body",
    "Chest",
    "Eyes",
    "Feet",
    "Feet",
    "Hands",
    "Head",
    "Neck",
    "Wrist",
    "Ring",
    "Slotless",
  ];

  bool statsGenerated = false;
  updateStats() {
    statsGenerated = !statsGenerated;
    notifyListeners();
  }

  resetEquipAndStats() {
    char.charEquip.armour = null;
    char.charEquip.shield = null;
    char.charEquip.meleeWeapon = null;
    char.charEquip.rangeWeapon = null;
    char.charEquip.wonderousItems = null;
    notifyListeners();
  }

  generateAll() {
    generateMagicItems();
    if (char.battleStyle.name == "Spellcaster" ||
        char.battleStyle.name == "Diplomat") {
      generateGearForNonPhysicalStyleChars();
    } else {
      if (char.physicalStyle.name == "Bowman" ||
          char.physicalStyle.name == "Marksman" ||
          char.physicalStyle.name == "Thrower") {
        char.charEquip.rangeWeapon = gettingMainWeapon();
        char.charEquip.meleeWeapon = generatingAlternativeWeapon();
      } else {
        char.charEquip.meleeWeapon = gettingMainWeapon();
        char.charEquip.rangeWeapon = generatingAlternativeWeapon();
      }
    }
    applyMagicToWeapon();
    notifyListeners();
  }

  showItemDescription(int index) {
    if (char.charEquip.wonderousItems![index].isSelected == true) {
      char.charEquip.wonderousItems![index].isSelected = false;
      notifyListeners();
      return;
    }
    for (var i in char.charEquip.wonderousItems!) {
      i.isSelected = false;
    }
    char.charEquip.wonderousItems![index].isSelected = true;
    notifyListeners();
  }

  List<String> findItemForBodyParts(int qnt) {
    List<String> listOfItemsForChar = [];
    List<String> listOfItemsLeft = [];
    listOfItemsLeft.addAll(itemsLabel);
    for (var i = 0; i < qnt; i++) {
      listOfItemsLeft.shuffle();
      var random = randomIndex.nextInt(listOfItemsLeft.length);
      if (random == listOfItemsLeft.length) {
        random--;
      }
      listOfItemsForChar.add(listOfItemsLeft[random]);
      if (listOfItemsLeft[random] != "Slotless") {
        listOfItemsLeft
            .removeWhere((element) => element == listOfItemsLeft[random]);
      }
    }
    return listOfItemsForChar;
  }

  int discoverMinAvailability(int lvAvailable) {
    var minLvAvailable = 0;
    if (lvAvailable > 8) {
      minLvAvailable = lvAvailable - 8;
    }
    return minLvAvailable;
  }

  List<WonderousItemsModel> findMagicItem(int lvAvailable) {
    var minLvAvailable = discoverMinAvailability(lvAvailable);
    var list = listOfWonderousItems.allItems
        .where((element) =>
            element.availability <= lvAvailable &&
            element.availability >= minLvAvailable &&
            (element.exclusiveClasses.isEmpty ||
                // ignore: iterable_contains_unrelated_type
                element.exclusiveClasses
                    .contains((element) => element == char.charClass.name)))
        .toList();
    return list;
  }

  generateMagicItems() {
    if (char.charLevel < 4 && char.charLevel > 1) {
      var random = randomIndex.nextInt(10);
      random < 5
          ? addIndispensableItem(listOfWonderousItems.protRings)
          : addIndispensableItem(listOfWonderousItems.resistCloaks);
      return;
    }
    var availableItems = findMagicItem(char.charLevel);
    var numberOfItems = (char.charLevel / 4).floor();
    var itemsPerBodyParts = findItemForBodyParts(numberOfItems);
    List<WonderousItemsModel> charMagicItems = [];
    for (var i = 0; i < numberOfItems; i++) {
      List<WonderousItemsModel> items = availableItems
          .where((element) => element.type == itemsPerBodyParts[i])
          .toList();
      var random = randomIndex.nextInt(items.length);
      if (random == items.length) {
        random--;
      }
      charMagicItems.add(items[random]);
    }
    char.charEquip.wonderousItems = charMagicItems;
    switch (char.charClass.mainAtrb) {
      case "Str":
        adjustingItemForMainAtrbBoost("Belt", "Belt of giant strength",
            "Belt of physical might", "Belt of physical perfection");
        break;
      case "Dex":
        adjustingItemForMainAtrbBoost("Belt", "Belt of incredible dexterity",
            "Belt of physical might", "Belt of physical perfection");
        break;
      case "Int":
        adjustingItemForMainAtrbBoost("Belt", "Belt of mighty constitution",
            "Belt of physical might", "Belt of physical perfection");
        break;
      case "Wis":
        adjustingItemForMainAtrbBoost("Belt", "Belt of mighty constitution",
            "Belt of physical might", "Belt of physical perfection");
        break;
      default:
        adjustingItemForMainAtrbBoost("Belt", "Belt of mighty constitution",
            "Belt of physical might", "Belt of physical perfection");
    }
    switch (char.charClass.mainAtrb) {
      case "Str":
        adjustingItemForMainAtrbBoost("Headband", "Headband of inspired wisdom",
            "Headband of mental prowess", "Headband of mental superiority");
        break;
      case "Dex":
        adjustingItemForMainAtrbBoost("Headband", "Headband of inspired wisdom",
            "Headband of mental prowess", "Headband of mental superiority");
        break;
      case "Int":
        adjustingItemForMainAtrbBoost(
            "Headband",
            "Headband of vast intelligence",
            "Headband of mental prowess",
            "Headband of mental superiority");
        break;
      case "Wis":
        adjustingItemForMainAtrbBoost("Headband", "Headband of inspired wisdom",
            "Headband of mental prowess", "Headband of mental superiority");
        break;
      default:
        adjustingItemForMainAtrbBoost(
            "Headband",
            "Headband of alluring charisma",
            "Headband of mental prowess",
            "Headband of mental superiority");
    }
    addIndispensableItem(listOfWonderousItems.protRings);
    addIndispensableItem(listOfWonderousItems.resistCloaks);
    addExtraIounStones();
    char.charEquip.wonderousItems!.shuffle();
    notifyListeners();
  }

  addExtraIounStones() {
    if (char.charLevel < 9) {
      return;
    } else {
      var newIounStone = listOfWonderousItems.allItems
          .where((element) => element.name == "Ioun Stone (dusty rose)")
          .toList();
      char.charEquip.wonderousItems!.addAll(newIounStone);
    }
    if (char.charLevel < 11) {
      return;
    } else {
      switch (char.charClass.mainAtrb) {
        case "Str":
          char.charEquip.wonderousItems!
              .addAll(findingRightIounStone("Ioun Stone (Pale blue)"));
          break;
        case "Dex":
          char.charEquip.wonderousItems!
              .addAll(findingRightIounStone("Ioun Stone (Deep red)"));
          break;
        case "Int":
          char.charEquip.wonderousItems!
              .addAll(findingRightIounStone("Ioun Stone (Scarlet and blue)"));
          break;
        case "Wis":
          char.charEquip.wonderousItems!
              .addAll(findingRightIounStone("Ioun Stone (Incandescent blue)"));
          break;
        default:
          char.charEquip.wonderousItems!
              .addAll(findingRightIounStone("Ioun Stone (Pink and green)"));
      }
    }
    notifyListeners();
  }

  List<WonderousItemsModel> findingRightIounStone(String iounStone) {
    return listOfWonderousItems.allItems
        .where((element) => element.name == iounStone)
        .toList();
  }

  adjustingItemForMainAtrbBoost(
      String item, String lesser, String medium, String greater) {
    var randomChance = randomIndex.nextInt(10);
    if (char.charLevel > 4 && char.charLevel < 9) {
      adjustingBeltOrHeadband(item, lesser);
    } else if (char.charLevel > 8 && char.charLevel < 15) {
      randomChance < 4
          ? adjustingBeltOrHeadband(item, lesser)
          : adjustingBeltOrHeadband(item, medium);
    } else if (char.charLevel > 14 && char.charLevel < 21) {
      randomChance < 4
          ? adjustingBeltOrHeadband(item, medium)
          : adjustingBeltOrHeadband(item, greater);
    }
  }

  adjustingBeltOrHeadband(String item, String itemName) {
    var min = discoverMinAvailability(char.charLevel);
    var list = listOfWonderousItems.allItems
        .where((element) =>
            element.name!.contains(itemName) &&
            element.availability <= char.charLevel &&
            element.availability >= min)
        .toList();
    char.charEquip.wonderousItems!
        .removeWhere((element) => element.type == item);
    var random = randomIndex.nextInt(10);
    random > 6
        ? char.charEquip.wonderousItems!.add(list.last)
        : char.charEquip.wonderousItems!.add(list.first);
    notifyListeners();
  }

  addIndispensableItem(List<WonderousItemsModel> list) {
    var random = randomIndex.nextInt(10);
    var itemList = [];
    if (char.charLevel > 1 && char.charLevel < 5) {
      itemList.add(list[0]);
    } else if (char.charLevel > 4 && char.charLevel < 9) {
      random < 6 ? itemList.add(list[0]) : itemList.add(list[1]);
    } else if (char.charLevel > 8 && char.charLevel < 13) {
      random < 6 ? itemList.add(list[1]) : itemList.add(list[2]);
    } else if (char.charLevel > 12 && char.charLevel < 16) {
      random < 6 ? itemList.add(list[2]) : itemList.add(list[3]);
    } else {
      random < 6 ? itemList.add(list[3]) : itemList.add(list[4]);
    }
    char.charEquip.wonderousItems!.add(itemList.single);
    notifyListeners();
  }

  // ===================================================================================
  // Weapon Section

  sortingWeapons(PhysicalStyleModel style) {
    return equip.allWeapons
        .where((element) =>
            (element.type!.wielding == style.weaponType ||
                element.type!.name == style.weaponType) &&
            element.type!.name != "Fist" &&
            element.type!.name != "Knife" &&
            element.type!.name != "Exotic" &&
            !element.forbiddenTo.contains(char.charClass.name))
        .toList();
  }

  WeaponModel gettingMainWeapon() {
    WeaponModel weapon;
    List<PhysicalStyleModel> style = classData.physicalStyles;
    List<WeaponModel> possibleWeapons = [];
    if (char.physicalStyle.name == "Berserker") {
      possibleWeapons = sortingWeapons(style[0]);
    } else if (char.physicalStyle.name == "Soldier") {
      possibleWeapons = sortingWeapons(style[1]);
    } else if (char.physicalStyle.name == "Knifeman") {
      possibleWeapons = equip.allWeapons
          .where((element) =>
              element.type!.name == style[4].weaponType &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
    } else if (char.physicalStyle.name == "Dual-weilder") {
      possibleWeapons = equip.allWeapons
          .where((element) =>
              (element.type!.name == "Sword" || element.type!.name == "Axe") &&
              element.type!.wielding == "One-handed" &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
    } else if (char.physicalStyle.name == "Swordsman") {
      possibleWeapons = equip.allWeapons
          .where((element) =>
              element.type!.name == "Sword" &&
              element.type!.wielding == "One-handed" &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
    } else if (char.physicalStyle.name == "Martial") {
      possibleWeapons = equip.allWeapons
          .where((element) =>
              element.type!.wielding == "One-handed" &&
              element.type!.name == "Fist" &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
    } else if (char.physicalStyle.name == "Bowman") {
      possibleWeapons = equip.allWeapons
          .where((element) =>
              element.name == "Composite longbow" &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
    } else if (char.physicalStyle.name == "Marksman") {
      possibleWeapons = equip.allWeapons
          .where((element) =>
              element.type!.name == "Crossbow" &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
    } else if (char.physicalStyle.name == "Thrower") {
      possibleWeapons = equip.allWeapons
          .where((element) =>
              element.type!.name == "Throwing" &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
    }
    var random = randomIndex.nextInt(possibleWeapons.length);
    if (random == possibleWeapons.length) {
      random--;
    }
    if ((char.charClass.name == "Barbarian" ||
            char.charClass.name == "Warrior" ||
            char.charClass.name == "Paladin" ||
            char.charClass.name == "Antipaladin" ||
            char.charClass.name == "Samurai") &&
        char.physicalStyle.name == "Berserker") {
      var axeOrSwordOrMace = possibleWeapons
          .where((element) =>
              element.type!.name == "Axe" ||
              element.type!.name == "Sword" ||
              element.type!.name == "Mace")
          .toList();
      var random = randomIndex.nextInt(axeOrSwordOrMace.length);
      weapon = axeOrSwordOrMace[random];
    } else {
      weapon = possibleWeapons[random];
    }
    return weapon;
  }

  WeaponModel generatingAlternativeWeapon() {
    WeaponModel alternatiWeapon;
    if (char.physicalStyle.name == "Bowman" ||
        char.physicalStyle.name == "Marksman" ||
        char.physicalStyle.name == "Thrower") {
      List<WeaponModel> weapons = equip.allWeapons
          .where((element) =>
              element.type!.name == "Sword" &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
      var random = randomIndex.nextInt(weapons.length);
      alternatiWeapon = weapons[random];
    } else {
      List<WeaponModel> weapons = equip.allWeapons
          .where((element) =>
              ((element.type!.name == "Bow" ||
                  element.type!.name == "Crossbow" ||
                  element.type!.name == "Throwing")) &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
      var random = randomIndex.nextInt(weapons.length);
      alternatiWeapon = weapons[random];
    }
    return alternatiWeapon;
  }

  generateGearForNonPhysicalStyleChars() {
    WeaponModel meleeWeapon;
    meleeWeapon =
        equip.allWeapons.firstWhere((element) => element.name == "Dagger");
    char.charEquip.meleeWeapon = meleeWeapon;
    WeaponModel rangeWeapon;
    rangeWeapon =
        equip.allWeapons.firstWhere((element) => element.name == "Crossbow");
    char.charEquip.meleeWeapon = rangeWeapon;
    char.charEquip.armour = null;
    char.charEquip.shield = null;
    notifyListeners();
  }

  // ===================================================================================

  //Apply magic to weapon

  applyMagicToWeapon() {
    if (char.charLevel < 5) {
      return;
    }
    var minAvail = discoverMinAvailability(char.charLevel);
    var checkAvailability = char.charLevel < 14 ? 5 : minAvail;
    var enchantPowerLvs = listOfEnchants.magicEnchants
        .where((element) =>
            element.availability < char.charLevel &&
            element.availability > minAvail)
        .toList();
    var enchants = listOfEnchants.allWeaponEnchants
        .where((element) => element.availability <= checkAvailability)
        .toList();
    char.charEquip.meleeWeapon!.enchantment = [enchantPowerLvs.last];
    char.charEquip.meleeWeapon!.enchantment = addOtherEnchantByChance(
        char.charEquip.meleeWeapon!.enchantment!, enchants, enchantPowerLvs);

    char.charEquip.rangeWeapon!.enchantment = [enchantPowerLvs.first];
    if (char.charEquip.rangeWeapon!.enchantment != []) {
      char.charEquip.rangeWeapon!.enchantment = addOtherEnchantByChance(
          char.charEquip.rangeWeapon!.enchantment!, enchants, enchantPowerLvs);
    }
    notifyListeners();
  }

  List<EnchantModel> addOtherEnchantByChance(List<EnchantModel> weaponEnchants,
      List<EnchantModel> enchants, List<EnchantModel> power) {
    var randomchance = randomIndex.nextInt(6);
    if (randomchance > 2) {
      weaponEnchants.clear();
      weaponEnchants = [power.first];
      enchants.shuffle();
      weaponEnchants.add(enchants[randomchance]);
      return weaponEnchants;
    } else {
      return weaponEnchants;
    }
  }

  // ===================================================================================
  // Armor section

  generateShield() {
    if (char.battleStyle.name != "Physical" &&
        char.physicalStyle.name != "Soldier") {
      return;
    } else {
      ArmorModel shield;
      List<ArmorModel> shields;
      if (char.charClass.name == "Druid") {
        shields = equip.allShields
            .where((element) => element.fitForDruid == true)
            .toList();
      } else {
        shields = equip.allShields;
      }
      var random = randomIndex.nextInt(shields.length);
      if (random == shields.length) {
        random--;
      }
      shield = shields[random];
      char.charEquip.shield = shield;
      notifyListeners();
    }
  }
}
