import 'dart:math';

import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/equip_models/enchant_model.dart';
import 'package:fantasy_name_generator/models/equip_models/wonderous_items_model.dart';
import 'package:fantasy_name_generator/shared/data/enchant_data.dart';
import 'package:fantasy_name_generator/shared/data/wonderous_items_data.dart';
import 'package:flutter/cupertino.dart';

class MagicItemController extends ChangeNotifier {
  CharModel? character;
  var listOfWonderousItems = WonderousItemsData();
  Random randomIndex = Random();
  var listOfEnchants = EnchantData();

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

  bool magicItemsGenerated = false;
  bool penaltyToDexNotApplied = false;

// section for applying magic to weapon

  applyMagicToWeapon() {
    if (character!.charLevel < 5) {
      return;
    }
    var minAvail = discoverMinAvailability(character!.charLevel);
    var checkAvailability = character!.charLevel < 14 ? 5 : minAvail;
    var enchantPowerLvs = listOfEnchants.magicEnchants
        .where((element) =>
            element.availability < character!.charLevel &&
            element.availability > minAvail)
        .toList();
    var enchants = listOfEnchants.allWeaponEnchants
        .where((element) => element.availability <= checkAvailability)
        .toList();
    character!.charEquip.primaryWeapon!.enchantment = [enchantPowerLvs.last];
    character!.charEquip.primaryWeapon!.enchantment = addOtherEnchantByChance(
        character!.charEquip.primaryWeapon!.enchantment!,
        enchants,
        enchantPowerLvs);
    if (character!.charEquip.secondaryWeapon != null) {
      character!.charEquip.secondaryWeapon!.enchantment = [
        enchantPowerLvs.last
      ];
      character!.charEquip.secondaryWeapon!.enchantment =
          addOtherEnchantByChance(
              character!.charEquip.secondaryWeapon!.enchantment!,
              enchants,
              enchantPowerLvs);
    }
    character!.charEquip.emergencyWeapon!.enchantment = [enchantPowerLvs.first];
    if (character!.charEquip.emergencyWeapon!.enchantment != null) {
      character!.charEquip.emergencyWeapon!.enchantment =
          addOtherEnchantByChance(
              character!.charEquip.emergencyWeapon!.enchantment!,
              enchants,
              enchantPowerLvs);
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

// Section for applying magic to armor

  applyMagicToArmor() {
    if (character!.charEquip.armour == null) {
      return;
    }
    if (character!.charLevel < 5) {
      return;
    }
    var armor = character!.charEquip.armour;
    var minAvail = discoverMinAvailability(character!.charLevel);
    var randomEnchant = randomIndex.nextInt(10);
    var enchantPowerLvs = listOfEnchants.magicEnchants
        .where((element) =>
            element.availability < character!.charLevel &&
            element.availability > minAvail)
        .toList();
    randomEnchant > 5
        ? armor!.enchantment = enchantPowerLvs.last
        : armor!.enchantment = enchantPowerLvs.first;
    var power = armor.enchantment!.power;
    armor.maxDexAllowed = armor.maxDexAllowed! + power;
    armor.checkPenalty =
        armor.checkPenalty! > power ? armor.checkPenalty! - power : 0;
    armor.defenseBonus = armor.defenseBonus! + power;
    character!.charEquip.armour = armor;
    character!.modAtributes.dexterity =
        ((character!.baseAtributes.dexterity! - 10) / 2).floor();
    if (character!.modAtributes.dexterity! >
        character!.charEquip.armour!.maxDexAllowed!) {
      character!.modAtributes.dexterity =
          character!.charEquip.armour!.maxDexAllowed!;
      penaltyToDexNotApplied = false;
    } else {
      penaltyToDexNotApplied = true;
    }
    notifyListeners();
  }

// Section for wonderouns items

  int discoverMinAvailability(int lvAvailable) {
    var minLvAvailable = 0;
    if (lvAvailable > 8) {
      minLvAvailable = lvAvailable - 8;
    }
    return minLvAvailable;
  }

  updateMagicItems() {
    magicItemsGenerated = !magicItemsGenerated;
    notifyListeners();
  }

  generateMagicEquip() {
    generateMagicItems();
    applyMagicToWeapon();
    applyMagicToArmor();
    updateMagicItems();
  }

  resetItems() {
    var power = 0;
    character!.charLevel < 5
        ? 0
        : power = character!.charEquip.armour!.enchantment!.power;
    character!.charEquip.wonderousItems = [];
    character!.charEquip.primaryWeapon!.enchantment = null;
    character!.charEquip.secondaryWeapon?.enchantment = null;
    character!.charEquip.emergencyWeapon?.enchantment = null;
    character!.charEquip.armour!.enchantment = null;
    character!.charEquip.shield?.enchantment = null;
    penaltyToDexNotApplied = false;
    if (character!.charEquip.armour != null) {
      character!.charEquip.armour!.defenseBonus =
          character!.charEquip.armour!.defenseBonus! - power;
      character!.charEquip.armour!.maxDexAllowed =
          character!.charEquip.armour!.maxDexAllowed! - power;
      character!.charEquip.armour!.checkPenalty =
          character!.charEquip.armour!.checkPenalty! - power;
      character!.modAtributes.dexterity =
          ((character!.baseAtributes.dexterity! - 10) / 2).floor();
      if (character!.modAtributes.dexterity! >
          character!.charEquip.armour!.maxDexAllowed!) {
        character!.modAtributes.dexterity =
            character!.charEquip.armour!.maxDexAllowed!;
        penaltyToDexNotApplied = false;
      }
    }
    updateMagicItems();
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

  List<WonderousItemsModel> findMagicItem(int lvAvailable) {
    var minLvAvailable = discoverMinAvailability(lvAvailable);
    var list = listOfWonderousItems.allItems
        .where((element) =>
            element.availability <= lvAvailable &&
            element.availability >= minLvAvailable &&
            (element.exclusiveClasses.isEmpty ||
                // ignore: iterable_contains_unrelated_type
                element.exclusiveClasses.contains(
                    (element) => element == character!.charClass.name)))
        .toList();
    return list;
  }

  generateMagicItems() {
    if (character!.charLevel < 4 && character!.charLevel > 1) {
      var random = randomIndex.nextInt(10);
      random < 5
          ? addIndispensableItem(listOfWonderousItems.protRings)
          : addIndispensableItem(listOfWonderousItems.resistCloaks);
      return;
    }
    var availableItems = findMagicItem(character!.charLevel);
    var numberOfItems = (character!.charLevel / 4).floor();
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
    character!.charEquip.wonderousItems = charMagicItems;
    switch (character!.charClass.mainAtrb) {
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
    switch (character!.charClass.mainAtrb) {
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
    adjustingIounStoneToClass();
    addExtraIounStone();
    stopBraceOfArmorAndArmorBonusFromStacking();
    character!.charEquip.wonderousItems!.shuffle();
    notifyListeners();
  }

  addIndispensableItem(List<WonderousItemsModel> list) {
    var random = randomIndex.nextInt(10);
    var itemList = [];
    if (character!.charLevel > 1 && character!.charLevel < 5) {
      itemList.add(list[0]);
    } else if (character!.charLevel > 4 && character!.charLevel < 9) {
      random < 6 ? itemList.add(list[0]) : itemList.add(list[1]);
    } else if (character!.charLevel > 8 && character!.charLevel < 13) {
      random < 6 ? itemList.add(list[1]) : itemList.add(list[2]);
    } else if (character!.charLevel > 12 && character!.charLevel < 16) {
      random < 6 ? itemList.add(list[2]) : itemList.add(list[3]);
    } else {
      random < 6 ? itemList.add(list[3]) : itemList.add(list[4]);
    }
    character!.charEquip.wonderousItems!.add(itemList.single);
    notifyListeners();
  }

  adjustingBeltOrHeadband(String item, String itemName) {
    var min = discoverMinAvailability(character!.charLevel);
    var list = listOfWonderousItems.allItems
        .where((element) =>
            element.name!.contains(itemName) &&
            element.availability <= character!.charLevel &&
            element.availability >= min)
        .toList();
    character!.charEquip.wonderousItems!
        .removeWhere((element) => element.type == item);
    var random = randomIndex.nextInt(10);
    random > 6
        ? character!.charEquip.wonderousItems!.add(list.last)
        : character!.charEquip.wonderousItems!.add(list.first);
    notifyListeners();
  }

  adjustingItemForMainAtrbBoost(
      String item, String lesser, String medium, String greater) {
    var randomChance = randomIndex.nextInt(10);
    if (character!.charLevel > 4 && character!.charLevel < 9) {
      adjustingBeltOrHeadband(item, lesser);
    } else if (character!.charLevel > 8 && character!.charLevel < 15) {
      randomChance < 4
          ? adjustingBeltOrHeadband(item, lesser)
          : adjustingBeltOrHeadband(item, medium);
    } else if (character!.charLevel > 14 && character!.charLevel < 21) {
      randomChance < 4
          ? adjustingBeltOrHeadband(item, medium)
          : adjustingBeltOrHeadband(item, greater);
    }
  }

  List<WonderousItemsModel> findingRightIounStone(String iounStone) {
    return listOfWonderousItems.allItems
        .where((element) => element.name == iounStone)
        .toList();
  }

  adjustingIounStoneToClass() {
    if (character!.charEquip.wonderousItems!
        .any((element) => element.name!.contains("Ioun Stone"))) {
      var stoneForRemoval = character!.charEquip.wonderousItems!
          .firstWhere((element) => element.name!.contains("Ioun Stone"));
      character!.charEquip.wonderousItems!.remove(stoneForRemoval);
      switch (character!.charClass.mainAtrb) {
        case "Str":
          character!.charEquip.wonderousItems!
              .addAll(findingRightIounStone("Ioun Stone (Pale blue)"));
          break;
        case "Dex":
          character!.charEquip.wonderousItems!
              .addAll(findingRightIounStone("Ioun Stone (Deep red)"));
          break;
        case "Int":
          character!.charEquip.wonderousItems!
              .addAll(findingRightIounStone("Ioun Stone (Scarlet and blue)"));
          break;
        case "Wis":
          character!.charEquip.wonderousItems!
              .addAll(findingRightIounStone("Ioun Stone (Incandescent blue)"));
          break;
        default:
          character!.charEquip.wonderousItems!
              .addAll(findingRightIounStone("Ioun Stone (Pink and green)"));
      }
    } else {
      return;
    }
    notifyListeners();
  }

  addExtraIounStone() {
    if (character!.charLevel > 11) {
      var newIounStone = listOfWonderousItems.allItems
          .where((element) => element.name == "Ioun Stone (dusty rose)")
          .toList();
      character!.charEquip.wonderousItems!.addAll(newIounStone);
    }
    notifyListeners();
  }

  stopBraceOfArmorAndArmorBonusFromStacking() {
    if (character!.charEquip.armour!.type!.name == "Heavy" ||
        character!.charEquip.armour!.type!.name == "Light" ||
        character!.charEquip.armour!.type!.name == "Medium") {
      if (character!.charEquip.wonderousItems!
          .any((element) => element.name!.contains("Bracers of armor"))) {
        character!.charEquip.wonderousItems!.removeWhere(
            (element) => element.name!.contains("Bracers of armor"));
        var newList = listOfWonderousItems.allItems
            .where((element) =>
                element.type! == "Wrist" &&
                !element.name!.contains("Bracers of armor"))
            .toList();
        var random = randomIndex.nextInt(newList.length);
        if (random == newList.length) {
          random--;
        }
        character!.charEquip.wonderousItems!.add(newList[random]);
        notifyListeners();
      }
    }
  }

  showItemDescription(int index) {
    if (character!.charEquip.wonderousItems![index].isSelected == true) {
      character!.charEquip.wonderousItems![index].isSelected = false;
      notifyListeners();
      return;
    }
    for (var i in character!.charEquip.wonderousItems!) {
      i.isSelected = false;
    }
    character!.charEquip.wonderousItems![index].isSelected = true;
    notifyListeners();
  }
}
