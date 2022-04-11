import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/combat_model.dart';
import 'package:fantasy_name_generator/models/equip_models/armor_model.dart';
import 'package:fantasy_name_generator/models/equip_models/gem_model.dart';
import 'package:fantasy_name_generator/models/equip_models/loot_model.dart';
import 'package:fantasy_name_generator/models/equip_models/treasure_model.dart';
import 'package:fantasy_name_generator/models/equip_models/weapon_model.dart';
import 'package:fantasy_name_generator/models/key_value.model.dart';
import 'package:fantasy_name_generator/models/physical_style_model.dart';
import 'package:fantasy_name_generator/models/resistance_model.dart';
import 'package:fantasy_name_generator/shared/data/class_data.dart';
import 'package:fantasy_name_generator/shared/data/equip_data.dart';
import 'package:fantasy_name_generator/shared/data/jwels_data.dart';
import 'package:flutter/cupertino.dart';

import '../models/base_atribute_model.dart';
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
  final _equip = EquipData();
  var classData = ClassData();
  var listOfRaces = RaceData();

  int armorPrice = 0;
  int shieldPrice = 0;
  int meleePrice = 0;
  int rangePrice = 0;

  final List<String> itemsLabel = [
    "Body",
    "Chest",
    "Eyes",
    "Feet",
    "Feet",
    "Hands",
    "Head",
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
    char.charEquip.armour = ArmorModel(price: 0);
    char.charEquip.shield =
        char.charEquip.shield == null ? null : ArmorModel(price: 0);
    char.charEquip.meleeWeapon = null;
    char.charEquip.rangeWeapon = null;
    char.charEquip.wonderousItems = null;
    char.baseAtributes = AtributeModel();
    char.modAtributes = AtributeModel();
    char.combatStats = CombatModel();
    char.resistances = ResistanceModel();
    char.charRace.speed = 0;
    char.hitPoints = 0;
    armorPrice = 0;
    shieldPrice = 0;
    meleePrice = 0;
    rangePrice = 0;
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
      char.charEquip.shield = generateShield();
      char.charEquip.armour = generateArmor();
      applyMagicToArmorAndShield();
    }
    calculateBaseAttackBonus();
    applyMagicToWeapon();
    gettingClassTraits();
    gettingClassSpecials();
    getFeats();
    calculateLoot();
    calculateSpeed();
    generateAllAtributs();
    getAtrbBoostFromWonderousItem();
    calculateAllModifiers();
    claculatingHitDefense();
    calculateResistances();
    generateHitPoints();
    gettingInitiative();
    calculateCombatManeuvers();
    calculatingPhysicalAttackAndDamage();
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
    var list = listOfWonderousItems.allItems
        .where((element) =>
            element.availability <= lvAvailable &&
            (element.exclusiveClasses.isEmpty ||
                // ignore: iterable_contains_unrelated_type
                element.exclusiveClasses
                    .contains((element) => element == char.charClass.name)))
        .toList();
    return list;
  }

  generateMagicItems() {
    if (char.charLevel < 5 && char.charLevel > 1) {
      var random = generateRandom(11);
      random < 5
          ? addIndispensableItem(listOfWonderousItems.protRings)
          : addIndispensableItem(listOfWonderousItems.resistCloaks);
      return;
    }
    var availableItems = findMagicItem(char.charLevel);
    var numberOfItems = (char.charLevel / 5).floor();
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
    if (((char.charClass.combatStyle == "Physical" ||
                char.charClass.combatStyle == "Hybrid") &&
            char.charLevel > 6) ||
        (char.charClass.combatStyle == "Spellcaster" && char.charLevel > 9)) {
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
    }
    if (((char.charClass.combatStyle == "Physical" ||
                char.charClass.combatStyle == "Hybrid") &&
            char.charLevel > 9) ||
        (char.charClass.combatStyle == "Spellcaster" && char.charLevel > 6)) {
      switch (char.charClass.mainAtrb) {
        case "Str":
          adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of inspired wisdom",
              "Headband of mental prowess",
              "Headband of mental superiority");
          break;
        case "Dex":
          adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of inspired wisdom",
              "Headband of mental prowess",
              "Headband of mental superiority");
          break;
        case "Int":
          adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of vast intelligence",
              "Headband of mental prowess",
              "Headband of mental superiority");
          break;
        case "Wis":
          adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of inspired wisdom",
              "Headband of mental prowess",
              "Headband of mental superiority");
          break;
        default:
          adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of alluring charisma",
              "Headband of mental prowess",
              "Headband of mental superiority");
      }
    }
    addIndispensableItem(listOfWonderousItems.protRings);
    addIndispensableItem(listOfWonderousItems.resistCloaks);
    if (char.battleStyle.name == "Physical" &&
        char.physicalStyle.name == "Martial") {
      addIndispensableItem(listOfWonderousItems.amuletMightyFists);
    } else if (char.battleStyle.name == "Physical" &&
        char.physicalStyle.name != "Martial") {
      addIndispensableItem(listOfWonderousItems.amuletOfArmor);
    } else if (char.battleStyle.name == "Spellcaster" ||
        char.battleStyle.name == "Diplomat") {
      List<WonderousItemsModel> posibleAmulets = listOfWonderousItems.allItems
          .where((element) => element.availability < char.charLevel)
          .toList();
      addIndispensableItem(posibleAmulets);
    }
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
    return listOfWonderousItems.basicIounStones
        .where((element) => element.name == iounStone)
        .toList();
  }

  adjustingItemForMainAtrbBoost(
      String item, String lesser, String medium, String greater) {
    var randomChance = generateRandom(11);
    if (char.charLevel > 4 && char.charLevel < 11) {
      adjustingBeltOrHeadband(item, lesser);
    } else if (char.charLevel > 10 && char.charLevel < 15) {
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
    List<WonderousItemsModel> itemList = [];
    if (char.charLevel == 1) {
      itemList = [];
    } else if (char.charLevel > 2 && char.charLevel < 8) {
      itemList.isEmpty ? itemList = [] : itemList.add(list[0]);
    } else if (char.charLevel > 7 && char.charLevel < 11) {
      random < 6 ? itemList.add(list[0]) : itemList.add(list[1]);
    } else if (char.charLevel > 10 && char.charLevel < 14) {
      random < 6 ? itemList.add(list[1]) : itemList.add(list[2]);
    } else if (char.charLevel > 13 && char.charLevel < 17) {
      random < 6 ? itemList.add(list[2]) : itemList.add(list[3]);
    } else {
      random < 6 ? itemList.add(list[3]) : itemList.add(list[4]);
    }
    char.charEquip.wonderousItems!.addAll(itemList);
    notifyListeners();
  }

  // ===================================================================================
  // Weapon Section

  sortingWeapons(PhysicalStyleModel style) {
    List<WeaponModel> list = _equip.allWeapons
        .where((element) =>
            (element.type!.wielding == style.weaponType ||
                element.type!.name == style.weaponType) &&
            element.type!.name != "Fist" &&
            element.type!.name != "Knife" &&
            element.type!.name != "Exotic" &&
            !element.forbiddenTo.contains(char.charClass.name))
        .toList();
    return list;
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
      possibleWeapons = _equip.allWeapons
          .where((element) =>
              element.type!.name == style[4].weaponType &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
    } else if (char.physicalStyle.name == "Dual-weilder") {
      possibleWeapons = _equip.allWeapons
          .where((element) =>
              (element.type!.name == "Sword" || element.type!.name == "Axe") &&
              element.type!.wielding == "One-handed" &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
    } else if (char.physicalStyle.name == "Swordsman") {
      possibleWeapons = _equip.allWeapons
          .where((element) =>
              element.type!.name == "Sword" &&
              element.type!.wielding == "One-handed" &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
    } else if (char.physicalStyle.name == "Martial") {
      possibleWeapons = _equip.allWeapons
          .where((element) =>
              element.type!.wielding == "One-handed" &&
              element.type!.name == "Fist" &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
    } else if (char.physicalStyle.name == "Bowman") {
      possibleWeapons = _equip.allWeapons
          .where((element) =>
              element.name == "Composite longbow" &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
    } else if (char.physicalStyle.name == "Marksman") {
      possibleWeapons = _equip.allWeapons
          .where((element) =>
              element.type!.name == "Crossbow" &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
    } else if (char.physicalStyle.name == "Thrower") {
      possibleWeapons = _equip.allWeapons
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
    notifyListeners();
    return weapon;
  }

  WeaponModel generatingAlternativeWeapon() {
    WeaponModel alternatiWeapon;
    if (char.physicalStyle.name == "Bowman" ||
        char.physicalStyle.name == "Marksman" ||
        char.physicalStyle.name == "Thrower") {
      List<WeaponModel> weapons = _equip.allWeapons
          .where((element) =>
              element.type!.name == "Sword" &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
      var random = generateRandom(weapons.length);
      alternatiWeapon = weapons[random];
    } else {
      List<WeaponModel> weapons = _equip.allWeapons
          .where((element) =>
              (element.type!.name == "Bow" ||
                  element.type!.name == "Crossbow" ||
                  element.type!.name == "Throwing") &&
              !element.forbiddenTo.contains(char.charClass.name))
          .toList();
      var random = generateRandom(weapons.length);
      alternatiWeapon = weapons[random];
    }
    notifyListeners();
    return alternatiWeapon;
  }

  generateGearForNonPhysicalStyleChars() {
    WeaponModel meleeWeapon;
    meleeWeapon =
        _equip.allWeapons.firstWhere((element) => element.name == "Dagger");
    char.charEquip.meleeWeapon = meleeWeapon;
    WeaponModel rangeWeapon;
    rangeWeapon = _equip.allWeapons
        .firstWhere((element) => element.type!.name == "Crossbow");
    char.charEquip.meleeWeapon = rangeWeapon;
    char.charEquip.armour = null;
    char.charEquip.shield = null;
    notifyListeners();
  }

//====================================================================================
  // Calculate price
  int claculateMagicEquipPrice(dynamic weapon) {
    int valueLabel = 0;
    if (weapon.enchantment != null) {
      if (weapon.enchantment!.length > 1) {
        var magicPrices = EnchantData();
        int price =
            (weapon.enchantment![0].power + weapon.enchantment![1].power);
        KeyValueModel priceAdded = magicPrices.pricingForMagicWeapons
            .firstWhere((element) => element.key == price);
        valueLabel = weapon.price + priceAdded.value;
      } else {
        valueLabel = weapon.price + weapon.enchantment![0].enchantPrice;
      }
    } else {
      valueLabel = weapon.price;
    }
    return valueLabel;
  }
  // ===================================================================================

  //Apply magic to weapon

  applyMagicToWeapon() {
    if (char.charLevel < 5) {
      meleePrice = char.charEquip.meleeWeapon!.price;
      rangePrice = char.charEquip.rangeWeapon!.price;
      notifyListeners();
      return;
    }
    var minAvail = discoverMinAvailability(char.charLevel);
    var checkAvailability = char.charLevel < 14 ? 5 : minAvail;
    var enchantPowerLvs = listOfEnchants.magicEnchants
        .where((element) =>
            element.availability <= char.charLevel &&
            element.availability >= minAvail)
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
      if (char.charEquip.meleeWeapon!.enchantment != [] && char.charLevel > 7) {
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
      if (char.charEquip.rangeWeapon!.enchantment != [] && char.charLevel > 7) {
        char.charEquip.rangeWeapon!.enchantment = addOtherEnchantByChance(
            char.charEquip.rangeWeapon!.enchantment!,
            enchants,
            enchantPowerLvs);
      }
    }
    meleePrice = claculateMagicEquipPrice(char.charEquip.meleeWeapon!) + 300;
    rangePrice = claculateMagicEquipPrice(char.charEquip.rangeWeapon!) + 300;
    notifyListeners();
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

  ArmorModel? generateShield() {
    if (char.physicalStyle.name != "Soldier") {
      return null;
    } else {
      ArmorModel shield;
      List<ArmorModel> shields;
      if (char.charClass.name == "Druid") {
        shields = _equip.allShields
            .where((element) => element.fitForDruid == true)
            .toList();
      } else {
        shields = _equip.allShields;
      }
      var random = generateRandom(shields.length);
      shield = shields[random];
      notifyListeners();
      return shield;
    }
  }

  ArmorModel generateArmor() {
    ArmorModel armor;
    List<ArmorModel> armors;
    if (char.charClass.name == "Druid") {
      armors = _equip.allArmors
          .where((element) => element.fitForDruid == true)
          .toList();
    } else if (char.charClass.mainAtrb == "Dex") {
      armors = _equip.allArmors
          .where((element) => element.type!.name == "Light")
          .toList();
    } else {
      armors = _equip.allArmors
          .where((element) =>
              !char.charClass.forbidenArmorType.contains(element.type!.name))
          .toList();
    }
    armors.sort(((a, b) => a.defenseBonus.compareTo(b.defenseBonus)));
    var random = generateRandom(armors.length);
    random > (armors.length / 3).floor()
        ? armor = armors[random]
        : armor = armors.last;
    notifyListeners();
    return armor;
  }

  // ===================================================================================
  //Apply magic to Armor and shield

  applyMagicToArmorAndShield() {
    if (char.charLevel < 5) {
      armorPrice =
          char.charEquip.armour != null ? char.charEquip.armour!.price : 0;
      shieldPrice =
          char.charEquip.shield != null ? char.charEquip.shield!.price : 0;
      notifyListeners();
      return;
    }
    var minAvail = discoverMinAvailability(char.charLevel);
    var enchantPowerLvs = listOfEnchants.magicEnchants
        .where((element) =>
            element.availability <= char.charLevel &&
            element.availability >= minAvail)
        .toList();
    if (char.charEquip.armour != null) {
      char.charEquip.armour =
          changeDefenseEquipToMagic(char.charEquip.armour!, enchantPowerLvs);
      armorPrice = ((claculateMagicEquipPrice(char.charEquip.armour!) +
                      char.charEquip.armour!.price) /
                  2)
              .floor() +
          150;
    }
    if (char.charEquip.shield != null) {
      char.charEquip.shield !=
          changeDefenseEquipToMagic(char.charEquip.shield!, enchantPowerLvs);
      shieldPrice = ((claculateMagicEquipPrice(char.charEquip.shield!) +
                      char.charEquip.shield!.price) /
                  2)
              .floor() +
          150;
    }
    notifyListeners();
  }

  ArmorModel changeDefenseEquipToMagic(
      ArmorModel equip, List<EnchantModel> list) {
    equip.enchantment = [list.last];
    equip.defenseBonus = equip.defenseBonus + equip.enchantment![0].power;
    equip.maxDexAllowed = equip.maxDexAllowed + equip.enchantment![0].power;
    equip.checkPenalty = equip.checkPenalty > equip.enchantment![0].power
        ? equip.checkPenalty - equip.enchantment![0].power
        : 0;
    return equip;
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
    if (char.charClass.name == "Barbarian" &&
        (char.charEquip.armour!.type!.name == "Light" ||
            char.charEquip.armour == null)) {
      baseSpeed = baseSpeed + 10;
    }
    if (char.charClass.name == "Monk" && char.charLevel > 2) {
      for (var i = 3; i <= char.charLevel; i = i + 3) {
        baseSpeed = baseSpeed + 10;
      }
    }
    char.charRace.speed = baseSpeed - char.charEquip.armour!.speedPenalty;
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
    if (char.charRace.name == "Human" || char.charRace.name == "Hafling") {
      cloneList.removeWhere((element) =>
          element.name == "Night Vision" && element.name == "Low-light Vision");
    }
    if (char.charRace.name == "Orc" ||
        char.charRace.name != "Dwarf" ||
        char.charRace.name != "Half-orc") {
      cloneList.removeWhere((element) => element.name == "Night Vision");
    }
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
      case "Dual-weilder":
        calculateFeats(classFeatList.dualWeilderFeat, allFeats.allFeats);
        break;
      default:
    }
  }

  calculateFeats(List<TraitModel> list, List<TraitModel> allFeats) {
    List<TraitModel> feats = list;
    var numberOfFeats = char.charLevel % 2 != 0
        ? ((char.charLevel + 1) / 2).floor()
        : (char.charLevel / 2).floor();
    if (char.charClass.name == "Warrior") {
      numberOfFeats = char.charLevel;
    }
    if (char.charRace.name == "Human") {
      numberOfFeats++;
    }
    List<TraitModel> filteredFeats = [];
    filteredFeats.insert(0, AllFeatsData().allFeats.first);
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
  LootModel charLoot = LootModel(items: [], jwels: []);
  var listOfGems = JwelsData();

  String getEquipFullName(dynamic equip) {
    if (equip.enchantment != null) {
      if (equip.enchantment.isEmpty) {
        return equip.name!;
      } else {
        return equip.enchantment!.length > 1
            ? "${equip.enchantment![1].enchant} ${equip.name} ${equip.enchantment![0].enchant}"
            : "${equip.name} ${equip.enchantment![0].enchant}";
      }
    }
    return equip.name!;
  }

  calculateLoot() {
    LootModel loot = LootModel(items: [], jwels: []);
    if (char.charEquip.wonderousItems != null) {
      for (var i in char.charEquip.wonderousItems!) {
        loot.items!.add(TreasureModel(
            name: i.name!, qnt: 1, price: i.price!, finalPrice: i.price!));
      }
    }
    String mW = char.charLevel > 2 && char.charLevel < 5 ? " (masterwork)" : "";
    int mwPrice = char.charLevel > 2 && char.charLevel < 5 ? 150 : 0;
    loot.items!.add(TreasureModel(
        name: getEquipFullName(char.charEquip.meleeWeapon!) + mW,
        qnt: 1,
        price: meleePrice + mwPrice + mwPrice,
        finalPrice: meleePrice));
    if (char.physicalStyle.name == "Dual-weilder") {
      loot.items!.add(TreasureModel(
          name: getEquipFullName(char.charEquip.meleeWeapon!) + mW,
          qnt: 1,
          price: meleePrice + mwPrice + mwPrice,
          finalPrice: meleePrice));
    }
    loot.items!.add(TreasureModel(
        name: getEquipFullName(char.charEquip.rangeWeapon!) + mW,
        qnt: 1,
        price: rangePrice + mwPrice + mwPrice,
        finalPrice: rangePrice));
    if (char.charEquip.armour != null) {
      loot.items!.add(TreasureModel(
          name: getEquipFullName(char.charEquip.armour!) + mW,
          qnt: 1,
          price: armorPrice + mwPrice,
          finalPrice: armorPrice));
    }
    if (char.charEquip.shield != null) {
      loot.items!.add(TreasureModel(
          name: getEquipFullName(char.charEquip.shield!) + mW,
          qnt: 1,
          price: shieldPrice + mwPrice,
          finalPrice: shieldPrice));
    }
    var value = 0;
    var valuePerClass = char.battleStyle.name == "Physical"
        ? 150 * char.charLevel
        : char.battleStyle.name == "Spellcaster"
            ? 800 * char.charLevel
            : char.battleStyle.name == "Hybrid"
                ? 400 * char.charLevel
                : 1400 * char.charLevel;
    List<GemModel> availableGems = listOfGems.gems
        .where((element) =>
            element.availabelAfterLevel <= char.charLevel &&
            element.price < valuePerClass)
        .toList();
    if (availableGems.isNotEmpty && char.charLevel > 5) {
      var quantity = char.charLevel > 5 ? (char.charLevel / 3).floor() : 1;
      var tries = 0;
      var possibleTries = (valuePerClass / 1000).ceil();
      possibleTries = possibleTries < 0 ? 1 : possibleTries;
      while (tries < possibleTries) {
        var random = generateRandom(availableGems.length);
        var randomQnt = rollingDice(quantity);
        var totalPrice = 0;
        var itemPrice = availableGems[random].price;
        if ((itemPrice * randomQnt) < (valuePerClass - value)) {
          var newRandom = generateRandom(availableGems.length);
          loot.jwels!.add(
            TreasureModel(
              name: availableGems[newRandom].name,
              price: itemPrice,
              qnt: randomQnt,
              finalPrice: randomQnt * itemPrice,
            ),
          );
          availableGems.removeWhere(
              (element) => element.name == availableGems[random].name);
          for (var i in loot.jwels!) {
            totalPrice += i.finalPrice;
          }
        }
        value = totalPrice;
        value > valuePerClass ? tries = 50 : tries++;
      }
    }
    var coin = char.battleStyle.name == "Physical"
        ? (rollingDice(20) * char.charLevel) * 100
        : char.battleStyle.name == "Spellcaster"
            ? (rollingDice(20) * char.charLevel) * 200
            : char.battleStyle.name == "Hybrid"
                ? (rollingDice(20) * char.charLevel) * 150
                : (rollingDice(20) * char.charLevel) * 300;
    coin = char.charLevel < 5
        ? (coin / 100).floor()
        : char.charLevel > 4 && char.charLevel < 11
            ? (coin / 50).floor()
            : char.charLevel > 10 && char.charLevel < 16
                ? (coin / 10).floor()
                : char.charLevel > 15 && char.charLevel < 21
                    ? (coin / 2).floor()
                    : char.charLevel > 20 && char.charLevel < 26
                        ? (coin / 1.5).floor()
                        : (coin / 1.2).floor();
    charLoot.jwels = loot.jwels;
    charLoot.items = loot.items;
    charLoot.gold = coin;
    notifyListeners();
  }

//=======================================================================================
// Section for generation of basic atributes

  sortAtributesToClass(int v0, int v1, int v2, int v3, int v4, int v5) {
    char.baseAtributes.strength = v0;
    char.baseAtributes.dexterity = v1;
    char.baseAtributes.constitution = v2;
    char.baseAtributes.intelligence = v3;
    char.baseAtributes.wisdom = v4;
    char.baseAtributes.charisma = v5;
    notifyListeners();
  }

  bool findIfItIsRangeCombatDistribution() {
    if (char.physicalStyle.name == "Bowman" ||
        char.physicalStyle.name == "Marksman" ||
        char.physicalStyle.name == "Thrower") {
      return true;
    } else {
      return false;
    }
  }

  generateAllAtributs() {
    List<int> atrbValues = [];
    for (var i = 0; i < 6; i++) {
      var atrbValue = rollingDice(10) + rollingDice(10) + rollingDice(10);
      if (char.charLevel <= 20) {
        while (atrbValue < 6) {
          atrbValue = rollingDice(10) + rollingDice(10) + rollingDice(10);
        }
        atrbValue = atrbValue > 18 ? 18 : atrbValue;
      } else if (char.charLevel > 20 && char.charLevel < 26) {
        while (atrbValue < 10) {
          atrbValue = rollingDice(10) + rollingDice(10) + rollingDice(10);
        }
        atrbValue = atrbValue > 18 ? 18 : atrbValue;
      } else {
        atrbValue = 18;
      }
      atrbValues.add(atrbValue);
    }
    atrbValues.sort((b, a) => a.compareTo(b));
    bool isRange = findIfItIsRangeCombatDistribution();
    switch (char.charClass.name) {
      case "Barbarian":
        isRange
            ? sortAtributesToClass(atrbValues[2], atrbValues[0], atrbValues[1],
                atrbValues[4], atrbValues[3], atrbValues[5])
            : sortAtributesToClass(atrbValues[0], atrbValues[2], atrbValues[1],
                atrbValues[4], atrbValues[3], atrbValues[5]);
        break;
      case "Warrior":
        isRange
            ? sortAtributesToClass(atrbValues[2], atrbValues[0], atrbValues[1],
                atrbValues[4], atrbValues[3], atrbValues[5])
            : sortAtributesToClass(atrbValues[0], atrbValues[2], atrbValues[1],
                atrbValues[4], atrbValues[3], atrbValues[5]);
        break;
      case "Arcanist":
        sortAtributesToClass(atrbValues[5], atrbValues[2], atrbValues[4],
            atrbValues[0], atrbValues[3], atrbValues[1]);
        break;
      case "Alchemist":
        sortAtributesToClass(atrbValues[5], atrbValues[2], atrbValues[3],
            atrbValues[0], atrbValues[1], atrbValues[4]);
        break;
      case "Wizard":
        sortAtributesToClass(atrbValues[5], atrbValues[3], atrbValues[2],
            atrbValues[0], atrbValues[1], atrbValues[4]);
        break;
      case "Cleric":
        sortAtributesToClass(atrbValues[2], atrbValues[3], atrbValues[1],
            atrbValues[4], atrbValues[0], atrbValues[5]);
        break;
      case "Druid":
        isRange
            ? sortAtributesToClass(atrbValues[3], atrbValues[2], atrbValues[1],
                atrbValues[5], atrbValues[0], atrbValues[4])
            : sortAtributesToClass(atrbValues[2], atrbValues[3], atrbValues[1],
                atrbValues[5], atrbValues[0], atrbValues[4]);
        break;
      case "Rogue":
        sortAtributesToClass(atrbValues[3], atrbValues[0], atrbValues[5],
            atrbValues[2], atrbValues[4], atrbValues[1]);
        break;
      case "Ranger":
        sortAtributesToClass(atrbValues[1], atrbValues[0], atrbValues[3],
            atrbValues[5], atrbValues[2], atrbValues[4]);
        break;
      case "Paladin":
        sortAtributesToClass(atrbValues[0], atrbValues[4], atrbValues[2],
            atrbValues[5], atrbValues[3], atrbValues[1]);
        break;
      case "Bard":
        sortAtributesToClass(atrbValues[5], atrbValues[3], atrbValues[4],
            atrbValues[2], atrbValues[1], atrbValues[0]);
        break;
      case "Sorcerer":
        sortAtributesToClass(atrbValues[5], atrbValues[4], atrbValues[2],
            atrbValues[3], atrbValues[1], atrbValues[0]);
        break;
      case "Monk":
        sortAtributesToClass(atrbValues[2], atrbValues[0], atrbValues[3],
            atrbValues[4], atrbValues[1], atrbValues[5]);
        break;
      case "Noble":
        sortAtributesToClass(atrbValues[4], atrbValues[4], atrbValues[4],
            atrbValues[2], atrbValues[2], atrbValues[1]);
        break;
      case "Aristocrat":
        sortAtributesToClass(atrbValues[4], atrbValues[4], atrbValues[4],
            atrbValues[0], atrbValues[1], atrbValues[3]);
        break;
      case "Bandit":
        isRange
            ? sortAtributesToClass(atrbValues[0], atrbValues[1], atrbValues[2],
                atrbValues[5], atrbValues[3], atrbValues[4])
            : sortAtributesToClass(atrbValues[1], atrbValues[0], atrbValues[2],
                atrbValues[5], atrbValues[3], atrbValues[4]);
        break;
      case "Samurai":
        sortAtributesToClass(atrbValues[0], atrbValues[1], atrbValues[2],
            atrbValues[5], atrbValues[3], atrbValues[4]);
        break;
      case "Summoner":
        sortAtributesToClass(atrbValues[1], atrbValues[2], atrbValues[3],
            atrbValues[5], atrbValues[4], atrbValues[0]);
        break;
      case "Antipaladin":
        sortAtributesToClass(atrbValues[0], atrbValues[4], atrbValues[2],
            atrbValues[5], atrbValues[3], atrbValues[1]);
        break;
      default:
        sortAtributesToClass(atrbValues[3], atrbValues[3], atrbValues[3],
            atrbValues[3], atrbValues[3], atrbValues[3]);
    }
    ajustStatsToRace();
    ajustStatsToLevel();
  }

  ajustStatsToLevel() {
    var physicalChars = listOfClasses.allClasses
        .where((element) => element.combatStyle == "Physical")
        .toList();
    int level = char.charLevel + 1;
    int mainAtributeIncrement = 0;
    double secondaryAtributeIncrement = 0.0;
    var atrbValues = char.baseAtributes;
    if (physicalChars
        .any((element) => element.combatStyle == char.battleStyle.name)) {
      for (var i = 0; i < level; i = i + 4) {
        mainAtributeIncrement++;
        secondaryAtributeIncrement = secondaryAtributeIncrement + 0.5;
      }
      char.baseAtributes.strength = atrbValues.strength + mainAtributeIncrement;
      char.baseAtributes.dexterity =
          atrbValues.dexterity + mainAtributeIncrement;
      char.baseAtributes.constitution =
          atrbValues.constitution + mainAtributeIncrement;
      char.baseAtributes.intelligence =
          atrbValues.intelligence + secondaryAtributeIncrement.floor();
      char.baseAtributes.wisdom =
          atrbValues.wisdom + secondaryAtributeIncrement.floor();
      char.baseAtributes.charisma =
          atrbValues.charisma + secondaryAtributeIncrement.floor();
    } else {
      for (var i = 0; i < level; i = i + 4) {
        mainAtributeIncrement++;
        secondaryAtributeIncrement = secondaryAtributeIncrement + 0.5;
      }
      char.baseAtributes.strength =
          atrbValues.strength + secondaryAtributeIncrement.floor();
      char.baseAtributes.dexterity =
          atrbValues.dexterity + secondaryAtributeIncrement.floor();
      char.baseAtributes.constitution =
          atrbValues.constitution + secondaryAtributeIncrement.floor();
      char.baseAtributes.intelligence =
          atrbValues.intelligence + mainAtributeIncrement;
      char.baseAtributes.wisdom = atrbValues.wisdom + mainAtributeIncrement;
      char.baseAtributes.charisma = atrbValues.charisma + mainAtributeIncrement;
    }
    notifyListeners();
  }

  ajustStatsToRace() {
    if (char.charRace.name == "Human" ||
        char.charRace.name == "Half-elf" ||
        char.charRace.name == "Half-orc") {
      switch (char.charClass.mainAtrb) {
        case "Str":
          calculateAjustToRace(2, 0, 0, 0, 0, 0);
          break;
        case "Dex":
          calculateAjustToRace(0, 2, 0, 0, 0, 0);
          break;
        case "Int":
          calculateAjustToRace(0, 0, 0, 2, 0, 0);
          break;
        case "Wis":
          calculateAjustToRace(0, 0, 0, 0, 2, 0);
          break;
        case "Cha":
          calculateAjustToRace(0, 0, 0, 0, 0, 2);
          break;
        default:
      }
    }
    switch (char.charRace.name) {
      case "Orc":
        calculateAjustToRace(4, 0, 2, -2, -2, -2);
        break;
      case "Elf":
        calculateAjustToRace(0, 2, -2, 2, 0, 0);
        break;
      case "Dwarf":
        calculateAjustToRace(0, 0, 2, 0, 2, -2);
        break;
      case "Gnome":
        calculateAjustToRace(-2, 0, 2, 0, 0, 2);
        break;
      case "Hafling":
        calculateAjustToRace(-2, 2, 0, 0, 0, 2);
        break;
      default:
    }
  }

  calculateAjustToRace(
    int adjutStr,
    int ajustDex,
    int ajustCon,
    int adjustInt,
    int ajustWis,
    int ajustCha,
  ) {
    var ajustedAtrb = char.baseAtributes;
    char.baseAtributes.strength = ajustedAtrb.strength + adjutStr;
    char.baseAtributes.dexterity = ajustedAtrb.dexterity + ajustDex;
    char.baseAtributes.constitution = ajustedAtrb.constitution + ajustCon;
    char.baseAtributes.intelligence = ajustedAtrb.intelligence + adjustInt;
    char.baseAtributes.wisdom = ajustedAtrb.wisdom + ajustWis;
    char.baseAtributes.charisma = ajustedAtrb.charisma + ajustCha;
    notifyListeners();
  }

  //====================================================================================
  // Calculate boost to atributes by magic items

  getAtrbBoostFromWonderousItem() {
    if (char.charEquip.wonderousItems == null) {
      return;
    }
    if (char.charEquip.wonderousItems!.isEmpty) {
      return;
    }
    //Boost from atribute iounstone (mandatory)
    if (char.charLevel > 11) {
      switch (char.charClass.mainAtrb) {
        case "Str":
          char.baseAtributes.strength += 2;
          break;
        case "Dex":
          char.baseAtributes.dexterity += 2;
          break;
        case "Int":
          char.baseAtributes.intelligence += 2;
          break;
        case "Wis":
          char.baseAtributes.wisdom += 2;
          break;
        default:
          char.baseAtributes.charisma += 2;
      }
    }
    List<WonderousItemsModel> list = char.charEquip.wonderousItems!;
    AtributeModel mentalAtr = AtributeModel();
    AtributeModel physicalAtr = AtributeModel();
    List<int> boosts = [];
    if (list.any((element) => element.type == "Belt")) {
      if (char.charClass.mainAtrb == "Str") {
        boosts = identifyBoost(list, "might", "perfection", "Belt");
        if (boosts.length == 3) {
          physicalAtr.strength = boosts.first;
          physicalAtr.dexterity = boosts.first;
          physicalAtr.constitution = boosts.first;
        } else if (boosts.length == 2) {
          physicalAtr.strength = boosts.first;
          physicalAtr.constitution = boosts.first;
        } else if (boosts.length == 1) {
          physicalAtr.strength = boosts.first;
        }
      } else if (char.charClass.mainAtrb == "Dex") {
        boosts = identifyBoost(list, "might", "perfection", "Belt");
        if (boosts.length == 3) {
          physicalAtr.strength = boosts.first;
          physicalAtr.dexterity = boosts.first;
          physicalAtr.constitution = boosts.first;
        } else if (boosts.length == 2) {
          physicalAtr.dexterity = boosts.first;
          physicalAtr.constitution = boosts.first;
        } else if (boosts.length == 1) {
          physicalAtr.dexterity = boosts.first;
        }
      } else {
        boosts = identifyBoost(list, "might", "perfection", "Belt");
        if (boosts.length == 3) {
          physicalAtr.strength = boosts.first;
          physicalAtr.dexterity = boosts.first;
          physicalAtr.constitution = boosts.first;
        } else if (boosts.length == 2) {
          physicalAtr.dexterity = boosts.first;
          physicalAtr.constitution = boosts.first;
        } else if (boosts.length == 1) {
          physicalAtr.constitution = boosts.first;
        }
      }
    }
    if (list.any((element) => element.type == "Headband")) {
      if (char.charClass.mainAtrb == "Int") {
        boosts = identifyBoost(list, "prowess", "superiority", "Headband");
        if (boosts.length == 3) {
          mentalAtr.intelligence = boosts.first;
          mentalAtr.wisdom = boosts.first;
          mentalAtr.charisma = boosts.first;
        } else if (boosts.length == 2) {
          mentalAtr.intelligence = boosts.first;
          mentalAtr.charisma = boosts.first;
        } else if (boosts.length == 1) {
          mentalAtr.intelligence = boosts.first;
        }
      } else if (char.charClass.mainAtrb == "Wis") {
        boosts = identifyBoost(list, "prowess", "superiority", "Headband");
        if (boosts.length == 3) {
          mentalAtr.intelligence = boosts.first;
          mentalAtr.wisdom = boosts.first;
          mentalAtr.charisma = boosts.first;
        } else if (boosts.length == 2) {
          mentalAtr.intelligence = boosts.first;
          mentalAtr.wisdom = boosts.first;
        } else if (boosts.length == 1) {
          mentalAtr.wisdom = boosts.first;
        }
      } else if (char.charClass.mainAtrb == "Cha") {
        boosts = identifyBoost(list, "prowess", "superiority", "Headband");
        if (boosts.length == 3) {
          mentalAtr.intelligence = boosts.first;
          mentalAtr.wisdom = boosts.first;
          mentalAtr.charisma = boosts.first;
        } else if (boosts.length == 2) {
          mentalAtr.charisma = boosts.first;
          mentalAtr.wisdom = boosts.first;
        } else if (boosts.length == 1) {
          mentalAtr.charisma = boosts.first;
        }
      } else {
        boosts = identifyBoost(list, "prowess", "superiority", "Headband");
        if (boosts.length == 3) {
          mentalAtr.intelligence = boosts.first;
          mentalAtr.wisdom = boosts.first;
          mentalAtr.charisma = boosts.first;
        } else if (boosts.length == 2) {
          mentalAtr.intelligence = boosts.first;
          mentalAtr.wisdom = boosts.first;
        } else if (boosts.length == 1) {
          mentalAtr.wisdom = boosts.first;
        }
      }
    }
    char.baseAtributes.strength += physicalAtr.strength;
    char.baseAtributes.dexterity += physicalAtr.dexterity;
    char.baseAtributes.constitution += physicalAtr.constitution;
    char.baseAtributes.intelligence += mentalAtr.intelligence;
    char.baseAtributes.wisdom += mentalAtr.wisdom;
    char.baseAtributes.charisma += mentalAtr.charisma;
    notifyListeners();
  }

  identifyBoost(
      List<WonderousItemsModel> list, String dual, String all, String type) {
    WonderousItemsModel? boostyItem;
    List<int> boosts = [];
    for (var i = 0; i < list.length; i++) {
      if (list[i].name!.contains(type)) {
        boostyItem = list[i];
        if (boostyItem.name!.contains(dual)) {
          boosts.add(boostyItem.bonus!);
          boosts.add(boostyItem.bonus!);
        } else if (boostyItem.name!.contains(all)) {
          boosts.add(boostyItem.bonus!);
          boosts.add(boostyItem.bonus!);
          boosts.add(boostyItem.bonus!);
        } else {
          boosts.add(boostyItem.bonus!);
        }
        return boosts;
      }
    }
  }

  boostWithTomeOrManual() {
    if (char.charLevel < 15) {
      return;
    }
    List<WonderousItemsModel> tomesAndManuals = [];
    if (char.charLevel > 15 && char.charLevel < 18) {
    } else if (char.charLevel > 15 && char.charLevel < 18) {
    } else if (char.charLevel > 15 && char.charLevel < 18) {}
  }

  //=====================================================================================
  // Modifier part
  calculateAllModifiers() {
    var atributes = char.baseAtributes;
    char.modAtributes.strength = calculateModifier(atributes.strength);
    char.modAtributes.dexterity = calculateModifier(atributes.dexterity);
    char.modAtributes.constitution = calculateModifier(atributes.constitution);
    char.modAtributes.intelligence = calculateModifier(atributes.intelligence);
    char.modAtributes.wisdom = calculateModifier(atributes.wisdom);
    char.modAtributes.charisma = calculateModifier(atributes.charisma);
    notifyListeners();
  }

  int calculateModifier(int baseValue) {
    double doubleValue = baseValue.toDouble();
    doubleValue = (doubleValue - 10) / 2;
    if (baseValue <= 9 && baseValue >= 8) {
      doubleValue = -1;
    }
    if (baseValue <= 7 && baseValue >= 6) {
      doubleValue = -2;
    }
    return doubleValue.toInt();
  }
  //=====================================================================================
  // section for hit points generation

  generateHitPoints() {
    var changeCharInfo = char;
    var hitPoints =
        changeCharInfo.charLevel * changeCharInfo.modAtributes.constitution;
    var diceHitPoints = calculateHipPointsDicePerClass();
    var toughness = charFeats.any((element) => element.traiName == "Toughness")
        ? char.charLevel
        : 0;
    hitPoints += diceHitPoints + toughness;
    char.hitPoints = hitPoints;
    notifyListeners();
  }

  int calculateHipPointsDicePerClass() {
    var dice = char.charClass.hitDice;
    var rollTimes = char.charLevel - 1;
    var hitpoints = dice;
    if (char.charLevel > 20 && char.charLevel < 26) {
      dice = dice! - 3;
      for (var i = 0; i < rollTimes; i++) {
        var sum = rollingDice(dice) + 3;
        hitpoints = hitpoints! + sum;
      }
    } else if (char.charLevel > 25) {
      dice = dice! - 5;
      for (var i = 0; i < rollTimes; i++) {
        var sum = rollingDice(dice) + 5;
        hitpoints = hitpoints! + sum;
      }
    } else {
      for (var i = 0; i < rollTimes; i++) {
        hitpoints = hitpoints! + rollingDice(dice!);
      }
    }
    return hitpoints!;
  }

//=======================================================================================

// section to generate Ac defense
  int findBoostyItem(int level, List<WonderousItemsModel> list, String name) {
    WonderousItemsModel itemBoost;
    var boost = 0;
    if (level > 2) {
      itemBoost = list.firstWhere((element) => element.name!.contains(name));
      boost = itemBoost.bonus!;
    }
    return boost;
  }

  claculatingHitDefense() {
    int armorDefense =
        char.charEquip.armour != null ? char.charEquip.armour!.defenseBonus : 0;
    int shieldDefense =
        char.charEquip.shield != null ? char.charEquip.shield!.defenseBonus : 0;
    int armorAc = 0;
    int touch = 0;
    int surprise = 0;
    armorAc = 10 + armorDefense + shieldDefense + char.modAtributes.dexterity;
    touch = 10 + char.modAtributes.dexterity;
    surprise = 10 + armorDefense + shieldDefense;
    if (char.charRace.size == "Small") {
      armorAc++;
      touch++;
      surprise++;
    }
    if (char.charRace.name == "Monk") {
      armorAc += char.modAtributes.wisdom;
      touch += char.modAtributes.wisdom;
      surprise += char.modAtributes.wisdom;
    }
    var ringBoost = findBoostyItem(
        char.charLevel, char.charEquip.wonderousItems!, "Ring of protection");
    armorAc += ringBoost;
    touch += ringBoost;
    surprise += ringBoost;
    var amuletBoost = findBoostyItem(char.charLevel,
        char.charEquip.wonderousItems!, "Amulet of natural armor");
    armorAc += amuletBoost;
    touch += amuletBoost;
    surprise += amuletBoost;
    if (char.charEquip.wonderousItems!
        .any((element) => element.name == "Vambraces of defense")) {
      armorAc++;
      surprise++;
    }

    //boost from mandatory iounstone for AC
    armorAc += char.charLevel > 9 ? 1 : 0;
    surprise += char.charLevel > 9 ? 1 : 0;
    touch += char.charLevel > 9 ? 1 : 0;

    char.combatStats.armourClass = armorAc;
    char.combatStats.armourTouch = touch;
    char.combatStats.armourSurprise = surprise;
    notifyListeners();
  }
//======================================================================================
// section to generate Ac defense

  calculateResistances() {
    ResistanceModel resists = ResistanceModel();
    int partialFort = 0;
    int partialRef = 0;
    int partialWill = 0;
    var bonusAtLevel = listOfClasses.goodOrBad[char.charLevel - 1];
    switch (char.charClass.resistUpgrade) {
      case "fort":
        partialFort = bonusAtLevel.good;
        partialRef = bonusAtLevel.bad;
        partialWill = bonusAtLevel.bad;
        break;
      case "ref":
        partialFort = bonusAtLevel.bad;
        partialRef = bonusAtLevel.good;
        partialWill = bonusAtLevel.bad;
        break;
      case "will":
        partialFort = bonusAtLevel.bad;
        partialRef = bonusAtLevel.bad;
        partialWill = bonusAtLevel.good;
        break;
      case "fort, will":
        partialFort = bonusAtLevel.good;
        partialRef = bonusAtLevel.bad;
        partialWill = bonusAtLevel.good;
        break;
      case "fort, ref":
        partialFort = bonusAtLevel.good;
        partialRef = bonusAtLevel.good;
        partialWill = bonusAtLevel.bad;
        break;
      case "ref, will":
        partialFort = bonusAtLevel.bad;
        partialRef = bonusAtLevel.good;
        partialWill = bonusAtLevel.good;
        break;
      case "all":
        partialFort = bonusAtLevel.good;
        partialRef = bonusAtLevel.good;
        partialWill = bonusAtLevel.good;
        break;
      default:
    }
    if (char.charRace.name == "Hafling") {
      partialFort += 1;
      partialRef += 1;
      partialWill += 1;
    }
    if (char.charClass.name == "Paladin" ||
        char.charClass.name == "Antipaladin") {
      var caris = char.modAtributes.charisma;
      partialFort += caris;
      partialWill += caris;
      partialRef += caris;
    }
    if (charFeats.any((element) => element.traiName == "Iron Will")) {
      partialWill += 2;
    }
    if (charFeats.any((element) => element.traiName == "Great Fortitude")) {
      partialFort += 2;
    }
    if (charFeats.any((element) => element.traiName == "Lightning Reflexes")) {
      partialRef += 2;
    }

    var boost = findBoostyItem(
        char.charLevel, char.charEquip.wonderousItems!, "Cloak of resistance");
    resists.fortitude = partialFort + char.modAtributes.constitution + boost;
    resists.reflex = partialRef + char.modAtributes.dexterity + boost;
    resists.will = partialWill + char.modAtributes.wisdom + boost;

    char.resistances = resists;
    notifyListeners();
  }

// ====================================================================================

// section to generate combat manouver modifiers

  calculateCombatManeuvers() {
    var bAttackBonus = char.combatStats.baseAttackBonus;
    var atributes = char.modAtributes;
    var cmb = 0;
    var cmd = 0;
    cmb = bAttackBonus! + atributes.strength;
    cmd = bAttackBonus + atributes.strength + atributes.dexterity + 10;
    if (char.charRace.size == "Small") {
      cmb -= 1;
      cmd -= 1;
    }
    char.combatStats.combatManeuverBonus = cmb;
    char.combatStats.combatManeuverDefense = cmd;
    notifyListeners();
  }
// ====================================================================================

// section to generate Initiative

  gettingInitiative() {
    //Reactionary points
    int init = 2;
    init = char.feats.any((element) => element.traiName == "Initiative")
        ? init += 4
        : init;
    init += char.modAtributes.dexterity;
    char.combatStats.initiative = init;
    notifyListeners();
  }

  //=====================================================================================
  // Section for calculating Attack and Damage

  int boostWeaponWithFeat(int melee, int range) {
    if (char.physicalStyle.name != "Bowman" ||
        char.physicalStyle.name != "Marksman" ||
        char.physicalStyle.name != "Thrower") {
      return melee;
    } else {
      return range;
    }
  }

  calculatingPhysicalAttackAndDamage() {
    String meleeAtk = "";
    int meleeAtkNum = 0;
    String rangeAtk = "";
    int rangeAtkNum = 0;
    int strOrWis = char.charClass.mainAtrb == "Wis"
        ? char.modAtributes.wisdom
        : char.modAtributes.strength;
    int bba = char.combatStats.baseAttackBonus!;
    if (charFeats.any((element) => element.traiName == "Weapon Finesse")) {
      meleeAtkNum += char.modAtributes.dexterity + bba;
    } else {
      meleeAtkNum += strOrWis + bba;
    }
    rangeAtkNum += char.modAtributes.dexterity + bba;
    if (char.charLevel == 3 || char.charLevel == 4) {
      meleeAtkNum++;
      rangeAtkNum++;
    } else if (char.charLevel > 4) {
      meleeAtkNum += char.charEquip.meleeWeapon!.enchantment![0].power;
      rangeAtkNum += char.charEquip.rangeWeapon!.enchantment![0].power;
    }
    if (charFeats.any((element) => element.traiName == "Weapon Focus")) {
      meleeAtkNum += boostWeaponWithFeat(1, 0);
      rangeAtkNum += boostWeaponWithFeat(0, 1);
    }
    if (charFeats
        .any((element) => element.traiName == "Greater Weapon Focus")) {
      meleeAtkNum += boostWeaponWithFeat(1, 0);
      rangeAtkNum += boostWeaponWithFeat(0, 1);
    }

    if (bba < 6) {
      meleeAtk = "+$meleeAtkNum";
      rangeAtk = "+$rangeAtkNum";
    } else if (bba > 5 && bba < 11) {
      meleeAtk = "+$meleeAtkNum / +${meleeAtkNum - 5}";
      rangeAtk = "+$rangeAtkNum / +${rangeAtkNum - 5}";
    } else if (bba > 10 && bba < 16) {
      meleeAtk = "+$meleeAtkNum / +${meleeAtkNum - 5} / +${meleeAtkNum - 10}";
      rangeAtk = "+$rangeAtkNum / +${rangeAtkNum - 5} / +${rangeAtkNum - 10}";
    } else {
      meleeAtk =
          "+$meleeAtkNum / +${meleeAtkNum - 5} / +${meleeAtkNum - 10} / +${meleeAtkNum - 15}";
      rangeAtk =
          "+$rangeAtkNum / +${rangeAtkNum - 5} / +${rangeAtkNum - 10} / +${rangeAtkNum - 15}";
    }
    int meleeDamage = 0;
    int rangeDamage = 0;
    if (char.charLevel > 4) {
      meleeDamage += char.modAtributes.strength +
          char.charEquip.meleeWeapon!.enchantment![0].power;
      rangeDamage += char.modAtributes.strength +
          char.charEquip.rangeWeapon!.enchantment![0].power;
    } else {
      meleeDamage += char.modAtributes.strength;
      rangeDamage += char.modAtributes.strength;
    }
    if (char.physicalStyle.name == "Berserker") {
      meleeDamage = (meleeDamage * 1.5).floor();
    }
    if (charFeats
        .any((element) => element.traiName == "Weapon Specialization")) {
      meleeDamage += boostWeaponWithFeat(2, 0);
      rangeDamage += boostWeaponWithFeat(0, 2);
    }
    if (charFeats.any(
        (element) => element.traiName == "Greater Weapon Specialization")) {
      meleeDamage += boostWeaponWithFeat(2, 0);
      rangeDamage += boostWeaponWithFeat(0, 2);
    }
    char.combatStats.meleeAttack = meleeAtk;
    char.combatStats.rangeAttack = rangeAtk;
    char.combatStats.meleeDamage = "$meleeDamage";
    char.combatStats.rangeDamage = "$rangeDamage";
    notifyListeners();
  }
}
