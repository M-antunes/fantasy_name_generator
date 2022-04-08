import 'dart:math';

import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/equip_models/armor_model.dart';
import 'package:fantasy_name_generator/models/equip_models/loot_model.dart';
import 'package:fantasy_name_generator/models/equip_models/weapon_model.dart';
import 'package:fantasy_name_generator/models/key_value.model.dart';
import 'package:fantasy_name_generator/models/physical_style_model.dart';
import 'package:fantasy_name_generator/shared/data/class_data.dart';
import 'package:fantasy_name_generator/shared/data/equip_data.dart';
import 'package:flutter/cupertino.dart';

import '../models/equip_models/enchant_model.dart';
import '../models/equip_models/wonderous_items_model.dart';
import '../models/specials_model.dart';
import '../models/traits_model.dart';
import '../shared/data/class_traits_data/barbarian/barbarian_traits_data.dart';
import '../shared/data/combat_style_feats_data/all_feats_data.dart';
import '../shared/data/combat_style_feats_data/readied_feats_data.dart';
import '../shared/data/enchant_data.dart';
import '../shared/data/race_data.dart';
import '../shared/data/wonderous_items_data.dart';
import '../shared/utils/utils.dart';

class StatsController with ChangeNotifier {
  late CharModel char;
  var listOfWonderousItems = WonderousItemsData();
  var listOfEnchants = EnchantData();
  var equip = EquipData();
  var classData = ClassData();
  var listOfRaces = RaceData();
  WeaponModel meleeWeapon = WeaponModel(forbiddenTo: [], price: 0);
  WeaponModel rangeWeapon = WeaponModel(forbiddenTo: [], price: 0);

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

  showDescriptions(int index, dynamic list) {
    if (list[index].isSelected == true) {
      list[index].isSelected = false;
      notifyListeners();
      return;
    }
    for (var i in list) {
      i.isSelected = false;
    }
    list[index].isSelected = true;
    notifyListeners();
  }

  resetEquipAndStats() {
    char.charEquip.armour = null;
    char.charEquip.shield = null;
    char.charEquip.meleeWeapon = null;
    char.charEquip.rangeWeapon = null;
    char.charEquip.wonderousItems = null;
    traits = [];
    specials = [];
    charFeats = [];
    charLoot = LootModel();
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
      generateShield();
      char.charEquip.armour = generateArmor();
      applyMagicToArmorAndShield();
    }
    calculateBaseAttackBonus();
    applyMagicToWeapon();
    gettingClassTraits();
    gettingClassSpecials();
    calculateSpeed();
    getFeats();
    calculateLoot();
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
      var random = generateRandom(listOfItemsLeft.length);
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
      var random = generateRandom(11);
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
      var random = generateRandom(items.length);

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
      var newIounStone = listOfWonderousItems.basicIounStones
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
    var randomChance = generateRandom(11);
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
    var random = generateRandom(11);
    random > 6
        ? char.charEquip.wonderousItems!.add(list.last)
        : char.charEquip.wonderousItems!.add(list.first);
    notifyListeners();
  }

  addIndispensableItem(List<WonderousItemsModel> list) {
    var random = generateRandom(11);
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
    var random = generateRandom(possibleWeapons.length);

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
      var random = generateRandom(axeOrSwordOrMace.length);
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
      var random = generateRandom(weapons.length);
      alternatiWeapon = weapons[random];
    } else {
      List<WeaponModel> weapons = equip.allWeapons
          .where((element) =>
              ((element.type!.name == "Bow" ||
                  element.type!.name == "Crossbow" ||
                  element.type!.name == "Throwing")) &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
      var random = generateRandom(weapons.length);
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
    if (char.physicalStyle.name == "Bowman" ||
        char.physicalStyle.name == "Marksman" ||
        char.physicalStyle.name == "Thrower") {
      char.charEquip.rangeWeapon!.enchantment = [enchantPowerLvs.last];
      char.charEquip.rangeWeapon!.enchantment = addOtherEnchantByChance(
          char.charEquip.rangeWeapon!.enchantment!, enchants, enchantPowerLvs);

      char.charEquip.meleeWeapon!.enchantment = [enchantPowerLvs.first];
      if (char.charEquip.meleeWeapon!.enchantment != []) {
        char.charEquip.meleeWeapon!.enchantment = addOtherEnchantByChance(
            char.charEquip.meleeWeapon!.enchantment!,
            enchants,
            enchantPowerLvs);
      }
    } else {
      char.charEquip.meleeWeapon!.enchantment = [enchantPowerLvs.last];
      char.charEquip.meleeWeapon!.enchantment = addOtherEnchantByChance(
          char.charEquip.meleeWeapon!.enchantment!, enchants, enchantPowerLvs);

      char.charEquip.rangeWeapon!.enchantment = [enchantPowerLvs.first];
      if (char.charEquip.rangeWeapon!.enchantment != []) {
        char.charEquip.rangeWeapon!.enchantment = addOtherEnchantByChance(
            char.charEquip.rangeWeapon!.enchantment!,
            enchants,
            enchantPowerLvs);
      }
    }
    claculateWeaponPrice(char.charEquip.meleeWeapon!);
    claculateWeaponPrice(char.charEquip.rangeWeapon!);
    notifyListeners();
  }

  claculateWeaponPrice(WeaponModel weapon) {
    if (weapon.enchantment != null) {
      if (weapon.enchantment!.length > 1) {
        weapon.price += weapon.enchantment![0].enchantPrice +
            weapon.enchantment![1].enchantPrice;
      } else {
        weapon.price += weapon.enchantment![0].enchantPrice;
      }
    }
  }

  List<EnchantModel> addOtherEnchantByChance(List<EnchantModel> weaponEnchants,
      List<EnchantModel> enchants, List<EnchantModel> power) {
    var randomchance = generateRandom(7);
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
      var random = generateRandom(shields.length);
      shield = shields[random];
      char.charEquip.shield = shield;
      notifyListeners();
    }
  }

  ArmorModel generateArmor() {
    ArmorModel armor;
    List<ArmorModel> armors;
    if (char.charClass.name == "Druid") {
      armors = equip.allArmors
          .where((element) => element.fitForDruid == true)
          .toList();
    } else if (char.charClass.mainAtrb == "Dex") {
      armors = equip.allArmors
          .where((element) => element.type!.name == "Light")
          .toList();
    } else {
      armors = equip.allArmors
          .where((element) =>
              !char.charClass.forbidenArmorType.contains(element.type!.name))
          .toList();
    }
    armors.sort(((a, b) => a.defenseBonus!.compareTo(b.defenseBonus!)));
    var random = generateRandom(armors.length);
    random > (armors.length / 3).floor()
        ? armor = armors[random]
        : armor = armors.last;

    // if(armor.maxDexAllowed! < char.modAtributes.dexterity!){
    //   armor = equip.noArmor;
    // }

    return armor;
  }

  // ===================================================================================
  //Apply magic to Armor and shield

  applyMagicToArmorAndShield() {
    if (char.charLevel < 5) {
      return;
    }
    var minAvail = discoverMinAvailability(char.charLevel);
    var enchantPowerLvs = listOfEnchants.magicEnchants
        .where((element) =>
            element.availability < char.charLevel &&
            element.availability > minAvail)
        .toList();
    char.charEquip.armour!.enchantment = enchantPowerLvs.last;
    char.charEquip.shield!.enchantment = enchantPowerLvs.last;

    char.charEquip.armour!.price +=
        char.charEquip.armour!.enchantment!.enchantPrice;
    char.charEquip.shield!.price +=
        char.charEquip.armour!.enchantment!.enchantPrice;

    notifyListeners();
  }

  //====================================================================================
  //Base Attack Bonus
  var listOfClasses = ClassData();

  calculateBaseAttackBonus() {
    var baseAttackBonus = 0;
    var magicClasses = listOfClasses.allClasses
        .where((element) => element.hitDice! < 7)
        .toList();
    var physicalClasses = listOfClasses.allClasses
        .where((element) => element.hitDice! > 9)
        .toList();
    var mixedClasses = listOfClasses.allClasses
        .where((element) => element.hitDice! == 8)
        .toList();
    var isMagicCl =
        magicClasses.any((element) => element.name == char.charClass.name);
    var isMixCl =
        mixedClasses.any((element) => element.name == char.charClass.name);
    var isPhysCl =
        physicalClasses.any((element) => element.name == char.charClass.name);
    if (isPhysCl) {
      baseAttackBonus = char.charLevel;
    }
    if (isMagicCl) {
      baseAttackBonus = char.charLevel;
      baseAttackBonus = (baseAttackBonus / 2).floor();
    }
    if (isMixCl) {
      baseAttackBonus = 0;
      var level = char.charLevel;

      if (level <= 4) {
        baseAttackBonus = level - 1;
      } else if (level >= 5 && level <= 8) {
        baseAttackBonus = level - 2;
      } else if (level >= 9 && level <= 12) {
        baseAttackBonus = level - 3;
      } else if (level >= 13 && level <= 16) {
        baseAttackBonus = level - 4;
      } else if (level >= 17 && level <= 20) {
        baseAttackBonus = level - 5;
      } else if (level >= 21 && level <= 25) {
        baseAttackBonus = level - 6;
      } else {
        baseAttackBonus = level - 7;
      }
    }
    char.combatStats.baseAttackBonus = baseAttackBonus;
    notifyListeners();
  }

// ======================================================================================
  ///calculate characters speed
  calculateSpeed() {
    var raceGotten = listOfRaces.races
        .firstWhere((element) => element.name == char.charRace.name);
    var baseSpeed = raceGotten.speed!;
    if (char.charClass.name == "Barbarian") {
      baseSpeed = baseSpeed + 10;
    }
    if (char.charClass.name == "Monk" && char.charLevel > 2) {
      for (var i = 3; i <= char.charLevel; i = i + 3) {
        baseSpeed = baseSpeed + 10;
      }
    }
    char.charRace.speed = baseSpeed - char.charEquip.armour!.speedPenalty!;
    notifyListeners();
  }

  // ===================================================================================
  //Traits part

  var barbarian = BarbarianTraitsData();
  List<SpecialsModel> specials = [];
  List<TraitModel> traits = [];

  gettingClassTraits() {
    List<TraitModel> newList = [];
    var valueList = [];
    List<TraitModel> replacementList = [];
    List<TraitModel> list = barbarian.barbarianTraits
        .where((element) => element.levelAcquired <= char.charLevel)
        .toList();
    var onlyVariableTraits =
        list.where((element) => element.multiplier != null).toList();
    list.removeWhere((element) => element.multiplier != null);
    for (var i in onlyVariableTraits) {
      var changableValue = char.charLevel - i.levelAcquired;
      if (i.levelAcquired == char.charLevel) {
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
    traits = replacementList;
    notifyListeners();
  }

  gettingClassSpecials() {
    var numberOfSpecial = (char.charLevel / 2).floor();
    List<SpecialsModel> cloneList = barbarian.ragePowers
        .where((element) => element.levelAcquired <= char.charLevel)
        .toList();
    List<SpecialsModel> specialList = [];
    for (var i = 0; i < numberOfSpecial; i++) {
      var random = generateRandom(cloneList.length);

      specialList.add(cloneList[random]);
      cloneList.remove(cloneList[random]);
    }
    specials = specialList;
    notifyListeners();
  }

  // ====================================================================================
  // Feat part
  var classFeatList = ReariedFeatsData();
  var allFeats = AllFeatsData();
  List<TraitModel> charFeats = [];
  getFeats() {
    switch (char.physicalStyle.name) {
      case "Berserker":
        calculateFeats(classFeatList.berserkerFeats, allFeats.allFeats);
        break;
      default:
    }
  }

  calculateFeats(List<TraitModel> list, List<TraitModel> allFeats) {
    List<TraitModel> feats = list;
    var numberOfFeats = char.charLevel % 2 != 0
        ? ((char.charLevel + 1) / 2).floor() + 1
        : (char.charLevel / 2).floor() + 1;
    if (char.charClass.name == "Warrior") {
      numberOfFeats = char.charLevel;
    }
    if (char.charRace.name == "Human") {
      numberOfFeats++;
    }
    List<TraitModel> filteredFeats = [];
    for (var i = 0; i < numberOfFeats; i++) {
      filteredFeats.add(feats[i]);
    }
    if (filteredFeats.length <= numberOfFeats) {
      charFeats = filteredFeats;
    } else {
      var featsLeft = numberOfFeats - filteredFeats.length;
      for (var i = 0; i < featsLeft; i++) {
        var random = generateRandom(featsLeft);
        filteredFeats.add(allFeats[random]);
        while (filteredFeats.contains(allFeats[random])) {
          var random = generateRandom(featsLeft);
          filteredFeats.add(allFeats[random]);
        }
      }
      charFeats = filteredFeats;
    }
    notifyListeners();
  }

  // ====================================================================================
  // Loot part
  late LootModel charLoot;

  calculateLoot() {
    LootModel loot = LootModel(items: [], jwels: []);
    if (char.charEquip.wonderousItems != null) {
      for (var i in char.charEquip.wonderousItems!) {
        loot.items!.add(KeyValueModel(key: i.name, value: i.price));
      }
      loot.items!.add(KeyValueModel(
          key: char.charEquip.meleeWeapon!.name,
          value: char.charEquip.meleeWeapon!.price));
      loot.items!.add(KeyValueModel(
          key: char.charEquip.rangeWeapon!.name,
          value: char.charEquip.rangeWeapon!.price));
      if (char.charEquip.armour != null) {
        loot.items!.add(KeyValueModel(
            key: char.charEquip.armour!.name,
            value: char.charEquip.armour!.price));
      }
      if (char.charEquip.shield != null) {
        loot.items!.add(KeyValueModel(
            key: char.charEquip.shield!.name,
            value: char.charEquip.shield!.price));
      }
    }
  }
}
