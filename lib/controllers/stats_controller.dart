import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/combat_model.dart';
import 'package:fantasy_name_generator/models/equip_models/armor_model.dart';
import 'package:fantasy_name_generator/models/equip_models/loot_model.dart';
import 'package:fantasy_name_generator/models/resistance_model.dart';
import 'package:fantasy_name_generator/models/skill_model.dart';
import 'package:fantasy_name_generator/modules/selection_sections/stats_sections/stats_tabs/loot/controller/loot_controller.dart';
import 'package:fantasy_name_generator/shared/data/class_data.dart';
import 'package:fantasy_name_generator/shared/data/equip_data.dart';
import 'package:fantasy_name_generator/shared/data/jwels_data.dart';
import 'package:flutter/cupertino.dart';

import '../models/base_atribute_model.dart';
import '../models/equip_models/wonderous_items_model.dart';
import '../models/specials_model.dart';
import '../models/traits_model.dart';
import '../modules/selection_sections/stats_sections/stats_tabs/ability_scores/controller/ability_controller.dart';
import '../modules/selection_sections/stats_sections/stats_tabs/combat/controller/defense_controller.dart';
import '../modules/selection_sections/stats_sections/stats_tabs/combat/controller/offense_controller.dart';
import '../modules/selection_sections/stats_sections/stats_tabs/magic_gear/controller/magic_gear_controller.dart';
import '../shared/data/class_traits_data/barbarian/barbarian_traits_data.dart';
import '../shared/data/combat_style_feats_data/all_feats_data.dart';
import '../shared/data/combat_style_feats_data/readied_feats_data.dart';
import '../shared/data/enchant_data.dart';
import '../shared/data/race_data.dart';
import '../shared/data/skill_data.dart';
import '../shared/data/wonderous_items_data.dart';
import '../shared/utils/utils.dart';

class StatsController with ChangeNotifier {
  late CharModel char;
  var listOfWonderousItems = WonderousItemsData();
  var listOfEnchants = EnchantData();
  final _equip = EquipData();
  var listOfClasses = ClassData();
  var listOfRaces = RaceData();
  var skillData = SkillData();
  var abilityCtrl = AbilityController();
  var magicGearCtrl = MagicGearController();
  var loot = LootController();
  var offense = OffenseController();
  var defense = DefenseController();
  List<WonderousItemsModel> tomesAndManuals = [];
  List<SkillModel> charSkills = [];

  int armorPrice = 0;
  int shieldPrice = 0;
  int meleePrice = 0;
  int rangePrice = 0;

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
    tomesAndManuals = [];
    charSkills = [];

    notifyListeners();
  }

  generateAll() {
    generateMagicItems();
    if (char.battleStyle.name == "Spellcaster" ||
        char.battleStyle.name == "Diplomat") {
      char.charEquip.meleeWeapon =
          offense.generateGearForNonPhysicalStyleChars(_equip.allWeapons, true);
      char.charEquip.rangeWeapon = offense.generateGearForNonPhysicalStyleChars(
          _equip.allWeapons, false);
    } else {
      if (char.physicalStyle.name == "Bowman" ||
          char.physicalStyle.name == "Marksman" ||
          char.physicalStyle.name == "Thrower") {
        char.charEquip.rangeWeapon = offense.gettingMainWeapon(
            listOfClasses.physicalStyles,
            char.physicalStyle.name,
            _equip.allWeapons,
            char.charClass.name);
        char.charEquip.meleeWeapon = offense.generatingAlternativeWeapon(
            char.physicalStyle.name, _equip.allWeapons, char.charClass.name);
      } else {
        char.charEquip.meleeWeapon = offense.gettingMainWeapon(
            listOfClasses.physicalStyles,
            char.physicalStyle.name,
            _equip.allWeapons,
            char.charClass.name);
        char.charEquip.rangeWeapon = offense.generatingAlternativeWeapon(
            char.physicalStyle.name, _equip.allWeapons, char.charClass.name);
      }
      char.charEquip.shield = defense.generateShield(
          char.physicalStyle.name, char.charClass.name, _equip.allShields);
      char.charEquip.armour = defense.generateArmor(
          char.charClass.forbidenArmorType,
          char.charClass.mainAtrb,
          char.charClass.name,
          _equip.allArmors);
    }
    calculateBaseAttackBonus();
    makeWeaponMagic();
    makeArmorOrShieldMagic();
    getCombatEquipPrices();
    gettingClassTraits();
    gettingClassSpecials();
    getFeats();
    generateLoot();
    calculateSpeed();
    generateAllAtributes();
    getAtrbBoostFromWonderousItem();
    getTomesAndAMnuals();
    boostWithTomeOrManual();
    calculateAllModifiers();
    claculatingHitDefense();
    calculateResistances();
    generateHitPoints();
    gettingInitiative();
    calculateCombatManeuvers();
    calculatingPhysicalAttackAndDamage();
    calculateClassSkills();
    notifyListeners();
  }

  generateMagicItems() {
    char.charEquip.wonderousItems = [];
    if (char.charLevel < 5 && char.charLevel > 1) {
      var random = generateRandom(11);
      random < 5
          ? char.charEquip.wonderousItems!.addAll(
              magicGearCtrl.addIndispensableItem(
                  listOfWonderousItems.protRings, char.charLevel))
          : char.charEquip.wonderousItems!.addAll(
              magicGearCtrl.addIndispensableItem(
                  listOfWonderousItems.resistCloaks, char.charLevel));
      return;
    }
    char.charEquip.wonderousItems!.addAll(magicGearCtrl.getWonderousItems(
        char.charLevel,
        char.charClass.combatStyle,
        char.charClass.mainAtrb,
        listOfWonderousItems.allItems,
        char.charClass.name));

    char.charEquip.wonderousItems!.addAll(magicGearCtrl.addIndispensableItem(
        listOfWonderousItems.protRings, char.charLevel));
    char.charEquip.wonderousItems!.addAll(magicGearCtrl.addIndispensableItem(
        listOfWonderousItems.resistCloaks, char.charLevel));
    if (char.battleStyle.name == "Physical" &&
        char.physicalStyle.name == "Martial") {
      char.charEquip.wonderousItems!.addAll(magicGearCtrl.addIndispensableItem(
          listOfWonderousItems.amuletMightyFists, char.charLevel));
    } else if (char.battleStyle.name == "Physical" &&
        char.physicalStyle.name != "Martial") {
      char.charEquip.wonderousItems!.addAll(magicGearCtrl.addIndispensableItem(
          listOfWonderousItems.amuletOfArmor, char.charLevel));
    } else if (char.battleStyle.name == "Spellcaster" ||
        char.battleStyle.name == "Diplomat") {
      List<WonderousItemsModel> posibleAmulets = listOfWonderousItems.allItems
          .where((element) => element.availability < char.charLevel)
          .toList();
      char.charEquip.wonderousItems!.addAll(
          magicGearCtrl.addIndispensableItem(posibleAmulets, char.charLevel));
    }
    char.charEquip.wonderousItems!.addAll(magicGearCtrl.addExtraIounStones(
        char.charLevel,
        listOfWonderousItems.basicIounStones,
        char.charClass.mainAtrb));
    char.charEquip.wonderousItems!.shuffle();
    notifyListeners();
  }

//====================================================================================
  // Calculate price
  // int claculateMagicEquipPrice(dynamic weapon) {
  //   int valueLabel = 0;
  //   if (weapon.enchantment != null) {
  //     if (weapon.enchantment!.length > 1) {
  //       var magicPrices = EnchantData();
  //       int price =
  //           (weapon.enchantment![0].power + weapon.enchantment![1].power);
  //       KeyValueModel priceAdded = magicPrices.pricingForMagicWeapons
  //           .firstWhere((element) => element.key == price);
  //       valueLabel = weapon.price + priceAdded.value;
  //     } else {
  //       valueLabel = weapon.price + weapon.enchantment![0].enchantPrice;
  //     }
  //   } else {
  //     valueLabel = weapon.price;
  //   }
  //   return valueLabel;
  // }
  // ===================================================================================

  //Apply magic to weapon

  makeWeaponMagic() {
    if (char.charLevel < 5) {
      return;
    } else {
      char.charEquip.meleeWeapon = offense.applyMagicToWeapon(
          char.charLevel,
          listOfEnchants.magicEnchants,
          listOfEnchants.allWeaponEnchants,
          char.physicalStyle.name,
          char.charEquip.rangeWeapon!,
          char.charEquip.meleeWeapon!,
          true);
      char.charEquip.rangeWeapon = offense.applyMagicToWeapon(
          char.charLevel,
          listOfEnchants.magicEnchants,
          listOfEnchants.allWeaponEnchants,
          char.physicalStyle.name,
          char.charEquip.rangeWeapon!,
          char.charEquip.meleeWeapon!,
          false);
    }
  }

  getCombatEquipPrices() {
    meleePrice = claculateMagicEquipPrice(char.charEquip.meleeWeapon!);
    rangePrice = claculateMagicEquipPrice(char.charEquip.rangeWeapon!);
    armorPrice = char.charEquip.armour != null
        ? ((claculateMagicEquipPrice(char.charEquip.armour!) +
                    char.charEquip.armour!.price) /
                2)
            .floor()
        : 0;
    shieldPrice = char.charEquip.shield != null
        ? ((claculateMagicEquipPrice(char.charEquip.shield!) +
                    char.charEquip.shield!.price) /
                2)
            .floor()
        : 0;
    notifyListeners();
  }

  // applyMagicToWeapon() {
  //   if (char.charLevel < 5) {
  //     meleePrice = char.charEquip.meleeWeapon!.price;
  //     rangePrice = char.charEquip.rangeWeapon!.price;
  //     notifyListeners();
  //     return;
  //   }
  //   var minAvail = discoverMinAvailability(char.charLevel);
  //   var checkAvailability = char.charLevel < 14 ? 5 : minAvail;
  //   var enchantPowerLvs = listOfEnchants.magicEnchants
  //       .where((element) =>
  //           element.availability <= char.charLevel &&
  //           element.availability >= minAvail)
  //       .toList();
  //   var enchants = listOfEnchants.allWeaponEnchants
  //       .where((element) => element.availability <= checkAvailability)
  //       .toList();
  //   if (char.physicalStyle.name == "Bowman" ||
  //       char.physicalStyle.name == "Marksman" ||
  //       char.physicalStyle.name == "Thrower") {
  //     char.charEquip.rangeWeapon!.enchantment = [enchantPowerLvs.last];
  //     char.charEquip.rangeWeapon!.enchantment = addOtherEnchantByChance(
  //         char.charEquip.rangeWeapon!.enchantment!, enchants, enchantPowerLvs);

  //     char.charEquip.meleeWeapon!.enchantment = [enchantPowerLvs.first];
  //     if (char.charEquip.meleeWeapon!.enchantment != [] && char.charLevel > 7) {
  //       char.charEquip.meleeWeapon!.enchantment = addOtherEnchantByChance(
  //           char.charEquip.meleeWeapon!.enchantment!,
  //           enchants,
  //           enchantPowerLvs);
  //     }
  //   } else {
  //     char.charEquip.meleeWeapon!.enchantment = [enchantPowerLvs.last];
  //     char.charEquip.meleeWeapon!.enchantment = addOtherEnchantByChance(
  //         char.charEquip.meleeWeapon!.enchantment!, enchants, enchantPowerLvs);

  //     char.charEquip.rangeWeapon!.enchantment = [enchantPowerLvs.first];
  //     if (char.charEquip.rangeWeapon!.enchantment != [] && char.charLevel > 7) {
  //       char.charEquip.rangeWeapon!.enchantment = addOtherEnchantByChance(
  //           char.charEquip.rangeWeapon!.enchantment!,
  //           enchants,
  //           enchantPowerLvs);
  //     }
  //   }
  //   meleePrice = claculateMagicEquipPrice(char.charEquip.meleeWeapon!) + 300;
  //   rangePrice = claculateMagicEquipPrice(char.charEquip.rangeWeapon!) + 300;
  //   notifyListeners();
  // }

  // List<EnchantModel> addOtherEnchantByChance(List<EnchantModel> weaponEnchants,
  //     List<EnchantModel> enchants, List<EnchantModel> power) {
  //   var randomchance = generateRandom(7);
  //   if (randomchance > 2) {
  //     weaponEnchants.clear();
  //     weaponEnchants = [power.first];
  //     enchants.shuffle();
  //     weaponEnchants.add(enchants[randomchance]);
  //     return weaponEnchants;
  //   } else {
  //     return weaponEnchants;
  //   }
  // }

  // ===================================================================================
  // Armor section

  // ArmorModel? generateShield() {
  //   if (char.physicalStyle.name != "Soldier") {
  //     return null;
  //   } else {
  //     ArmorModel shield;
  //     List<ArmorModel> shields;
  //     if (char.charClass.name == "Druid") {
  //       shields = _equip.allShields
  //           .where((element) => element.fitForDruid == true)
  //           .toList();
  //     } else {
  //       shields = _equip.allShields;
  //     }
  //     var random = generateRandom(shields.length);
  //     shield = shields[random];
  //     notifyListeners();
  //     return shield;
  //   }
  // }

  // ArmorModel generateArmor() {
  //   ArmorModel armor;
  //   List<ArmorModel> armors;
  //   if (char.charClass.name == "Druid") {
  //     armors = _equip.allArmors
  //         .where((element) => element.fitForDruid == true)
  //         .toList();
  //   } else if (char.charClass.mainAtrb == "dexterity") {
  //     armors = _equip.allArmors
  //         .where((element) => element.type!.name == "Light")
  //         .toList();
  //   } else {
  //     armors = _equip.allArmors
  //         .where((element) =>
  //             !char.charClass.forbidenArmorType.contains(element.type!.name))
  //         .toList();
  //   }
  //   armors.sort(((a, b) => a.defenseBonus.compareTo(b.defenseBonus)));
  //   var random = generateRandom(armors.length);
  //   random > (armors.length / 3).floor()
  //       ? armor = ArmorModel(
  //           name: armors[random].name,
  //           defenseBonus: armors[random].defenseBonus,
  //           checkPenalty: armors[random].checkPenalty,
  //           maxDexAllowed: armors[random].maxDexAllowed,
  //           speedPenalty: armors[random].speedPenalty,
  //           price: armors[random].price,
  //           type: armors[random].type,
  //         )
  //       : armor = ArmorModel(
  //           name: armors.last.name,
  //           defenseBonus: armors.last.defenseBonus,
  //           checkPenalty: armors.last.checkPenalty,
  //           maxDexAllowed: armors.last.maxDexAllowed,
  //           speedPenalty: armors.last.speedPenalty,
  //           price: armors.last.price,
  //           type: armors.last.type,
  //         );
  //   notifyListeners();
  //   return armor;
  // }

  // ===================================================================================
  //Apply magic to Armor and shield

  makeArmorOrShieldMagic() {
    char.charEquip.armour = defense.applyMagicToArmorAndShield(
        char.charLevel, listOfEnchants.magicEnchants, char.charEquip.armour!);
    char.charEquip.shield = char.charEquip.shield != null
        ? defense.applyMagicToArmorAndShield(char.charLevel,
            listOfEnchants.magicEnchants, char.charEquip.shield!)
        : null;
    notifyListeners();
  }

  // applyMagicToArmorAndShield() {

  //   var minAvail = discoverMinAvailability(char.charLevel);
  //   var enchantPowerLvs = listOfEnchants.magicEnchants
  //       .where((element) =>
  //           element.availability <= char.charLevel &&
  //           element.availability >= minAvail)
  //       .toList();
  //   if (char.charEquip.armour != null) {
  //     char.charEquip.armour =
  //         changeDefenseEquipToMagic(char.charEquip.armour!, enchantPowerLvs);
  //     armorPrice = ((claculateMagicEquipPrice(char.charEquip.armour!) +
  //                     char.charEquip.armour!.price) /
  //                 2)
  //             .floor() +
  //         150;
  //   }
  //   if (char.charEquip.shield != null) {
  //     char.charEquip.shield !=
  //         changeDefenseEquipToMagic(char.charEquip.shield!, enchantPowerLvs);
  //     shieldPrice = ((claculateMagicEquipPrice(char.charEquip.shield!) +
  //                     char.charEquip.shield!.price) /
  //                 2)
  //             .floor() +
  //         150;
  //   }
  //   notifyListeners();
  // }

  // ArmorModel changeDefenseEquipToMagic(
  //     ArmorModel equip, List<EnchantModel> list) {
  //   equip.enchantment = [list.last];
  //   equip.defenseBonus = equip.defenseBonus + equip.enchantment![0].power;
  //   equip.maxDexAllowed = equip.maxDexAllowed + equip.enchantment![0].power;
  //   equip.checkPenalty = equip.checkPenalty > equip.enchantment![0].power
  //       ? equip.checkPenalty - equip.enchantment![0].power
  //       : 0;
  //   return equip;
  // }

  //====================================================================================
  //Base Attack Bonus

  calculateBaseAttackBonus() {
    char.combatStats.baseAttackBonus = offense.calculateBaseAttackBonus(
        listOfClasses.allClasses, char.charClass.name, char.charLevel);
    notifyListeners();
  }
  //   var baseAttackBonus = 0;
  //   var magicClasses = listOfClasses.allClasses
  //       .where((element) => element.hitDice! < 7)
  //       .toList();
  //   var physicalClasses = listOfClasses.allClasses
  //       .where((element) => element.hitDice! > 9)
  //       .toList();
  //   var mixedClasses = listOfClasses.allClasses
  //       .where((element) => element.hitDice! == 8)
  //       .toList();
  //   var isMagicCl =
  //       magicClasses.any((element) => element.name == char.charClass.name);
  //   var isMixCl =
  //       mixedClasses.any((element) => element.name == char.charClass.name);
  //   var isPhysCl =
  //       physicalClasses.any((element) => element.name == char.charClass.name);
  //   if (isPhysCl) {
  //     baseAttackBonus = char.charLevel;
  //   }
  //   if (isMagicCl) {
  //     baseAttackBonus = char.charLevel;
  //     baseAttackBonus = (baseAttackBonus / 2).floor();
  //   }
  //   if (isMixCl) {
  //     baseAttackBonus = 0;
  //     var level = char.charLevel;

  //     if (level <= 4) {
  //       baseAttackBonus = level - 1;
  //     } else if (level >= 5 && level <= 8) {
  //       baseAttackBonus = level - 2;
  //     } else if (level >= 9 && level <= 12) {
  //       baseAttackBonus = level - 3;
  //     } else if (level >= 13 && level <= 16) {
  //       baseAttackBonus = level - 4;
  //     } else if (level >= 17 && level <= 20) {
  //       baseAttackBonus = level - 5;
  //     } else if (level >= 21 && level <= 25) {
  //       baseAttackBonus = level - 6;
  //     } else {
  //       baseAttackBonus = level - 7;
  //     }
  //   }
  //   char.combatStats.baseAttackBonus = baseAttackBonus;
  //   notifyListeners();
  // }

// ======================================================================================
  ///calculate characters speed
  calculateSpeed() {
    char.charRace.speed = offense.calculateSpeed(
        listOfRaces.races,
        char.charLevel,
        char.charRace.name,
        char.charClass.name,
        char.charRace.speed!,
        char.charEquip.armour!);
    notifyListeners();
  }
  //   var raceGotten = listOfRaces.races
  //       .firstWhere((element) => element.name == char.charRace.name);
  //   var baseSpeed = raceGotten.speed!;
  //   if (char.charClass.name == "Barbarian" &&
  //       (char.charEquip.armour!.type!.name == "Light" ||
  //           char.charEquip.armour == null)) {
  //     baseSpeed = baseSpeed + 10;
  //   }
  //   if (char.charClass.name == "Monk" && char.charLevel > 2) {
  //     for (var i = 3; i <= char.charLevel; i = i + 3) {
  //       baseSpeed = baseSpeed + 10;
  //     }
  //   }
  //   char.charRace.speed = baseSpeed - char.charEquip.armour!.speedPenalty;
  //   notifyListeners();
  // }

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
    filteredFeats.insert(0, AllFeatsData().reactionary);
    if (feats.length > numberOfFeats) {
      for (var i = 0; i < numberOfFeats; i++) {
        filteredFeats.add(feats[i]);
      }
      charFeats = filteredFeats;
    } else if (feats.length == numberOfFeats) {
      charFeats.addAll(feats);
    } else {
      filteredFeats.addAll(feats);
      var featsLeft = numberOfFeats - feats.length;
      for (var i = 0; i < featsLeft; i++) {
        var random = generateRandom(allFeats.length);
        var newItem = allFeats[random];
        while (filteredFeats.contains(newItem)) {
          var newRandom = generateRandom(allFeats.length);
          newItem = (allFeats[newRandom]);
        }
        filteredFeats.add(newItem);
      }
      charFeats.addAll(filteredFeats);
    }
    notifyListeners();
  }

  // ====================================================================================
  // Loot part
  LootModel charLoot = LootModel(items: [], jwels: []);
  var listOfGems = JwelsData();

  generateLoot() {
    charLoot = loot.calculateLoot(
        char.charEquip.wonderousItems!,
        char.charLevel,
        meleePrice,
        rangePrice,
        armorPrice,
        shieldPrice,
        char.charEquip,
        char.physicalStyle.name,
        char.battleStyle.name,
        listOfGems.gems);
    notifyListeners();
  }

//=======================================================================================
// Section for generation of basic atributes

  generateAllAtributes() {
    char.baseAtributes = abilityCtrl.addUpAtributeValues(
        char.charLevel,
        char.charClass.name,
        char.charRace.name,
        char.charClass.mainAtrb,
        char.charClass.combatStyle);
    notifyListeners();
  }

  //====================================================================================
  // Calculate boost to atributes by magic items

  getAtrbBoostFromWonderousItem() {
    char.baseAtributes = magicGearCtrl.getAtrbBoostFromWonderousItem(
      char.charEquip.wonderousItems!,
      char.charLevel,
      char.charClass.mainAtrb,
      char.baseAtributes,
    );
    notifyListeners();
  }

  getTomesAndAMnuals() {
    tomesAndManuals = magicGearCtrl.getTomesOrManuals(
        char.charLevel,
        char.charClass.mainAtrb,
        listOfWonderousItems.manualsAndTomes,
        char.battleStyle.name);
    notifyListeners();
  }

  boostWithTomeOrManual() {
    char.baseAtributes = magicGearCtrl.boostWithTomeOrManual(
        char.charLevel,
        char.charClass.mainAtrb,
        listOfWonderousItems.manualsAndTomes,
        tomesAndManuals,
        char.battleStyle.name,
        char.baseAtributes);
    notifyListeners();
  }
  //   if (char.charEquip.wonderousItems == null) {
  //     return;
  //   }
  //   if (char.charEquip.wonderousItems!.isEmpty) {
  //     return;
  //   }
  //   //Boost in atribute from iounstone (mandatory)
  //   if (char.charLevel > 11) {
  //     switch (char.charClass.mainAtrb) {
  //       case "strength":
  //         char.baseAtributes.strength += 2;
  //         break;
  //       case "dexterity":
  //         char.baseAtributes.dexterity += 2;
  //         break;
  //       case "intelligence":
  //         char.baseAtributes.intelligence += 2;
  //         break;
  //       case "wisdom":
  //         char.baseAtributes.wisdom += 2;
  //         break;
  //       default:
  //         char.baseAtributes.charisma += 2;
  //     }
  //   }
  //   List<WonderousItemsModel> list = char.charEquip.wonderousItems!;
  //   AtributeModel mentalAtr = AtributeModel();
  //   AtributeModel physicalAtr = AtributeModel();
  //   List<int> boosts = [];
  //   if (list.any((element) => element.type == "Belt")) {
  //     if (char.charClass.mainAtrb == "strength") {
  //       boosts = identifyBoost(list, "might", "perfection", "Belt");
  //       if (boosts.length == 3) {
  //         physicalAtr.strength = boosts.first;
  //         physicalAtr.dexterity = boosts.first;
  //         physicalAtr.constitution = boosts.first;
  //       } else if (boosts.length == 2) {
  //         physicalAtr.strength = boosts.first;
  //         physicalAtr.constitution = boosts.first;
  //       } else if (boosts.length == 1) {
  //         physicalAtr.strength = boosts.first;
  //       }
  //     } else if (char.charClass.mainAtrb == "dexterity") {
  //       boosts = identifyBoost(list, "might", "perfection", "Belt");
  //       if (boosts.length == 3) {
  //         physicalAtr.strength = boosts.first;
  //         physicalAtr.dexterity = boosts.first;
  //         physicalAtr.constitution = boosts.first;
  //       } else if (boosts.length == 2) {
  //         physicalAtr.dexterity = boosts.first;
  //         physicalAtr.constitution = boosts.first;
  //       } else if (boosts.length == 1) {
  //         physicalAtr.dexterity = boosts.first;
  //       }
  //     } else {
  //       boosts = identifyBoost(list, "might", "perfection", "Belt");
  //       if (boosts.length == 3) {
  //         physicalAtr.strength = boosts.first;
  //         physicalAtr.dexterity = boosts.first;
  //         physicalAtr.constitution = boosts.first;
  //       } else if (boosts.length == 2) {
  //         physicalAtr.dexterity = boosts.first;
  //         physicalAtr.constitution = boosts.first;
  //       } else if (boosts.length == 1) {
  //         physicalAtr.constitution = boosts.first;
  //       }
  //     }
  //   }
  //   if (list.any((element) => element.type == "Headband")) {
  //     if (char.charClass.mainAtrb == "intelligence") {
  //       boosts = identifyBoost(list, "prowess", "superiority", "Headband");
  //       if (boosts.length == 3) {
  //         mentalAtr.intelligence = boosts.first;
  //         mentalAtr.wisdom = boosts.first;
  //         mentalAtr.charisma = boosts.first;
  //       } else if (boosts.length == 2) {
  //         mentalAtr.intelligence = boosts.first;
  //         mentalAtr.charisma = boosts.first;
  //       } else if (boosts.length == 1) {
  //         mentalAtr.intelligence = boosts.first;
  //       }
  //     } else if (char.charClass.mainAtrb == "wisdom") {
  //       boosts = identifyBoost(list, "prowess", "superiority", "Headband");
  //       if (boosts.length == 3) {
  //         mentalAtr.intelligence = boosts.first;
  //         mentalAtr.wisdom = boosts.first;
  //         mentalAtr.charisma = boosts.first;
  //       } else if (boosts.length == 2) {
  //         mentalAtr.intelligence = boosts.first;
  //         mentalAtr.wisdom = boosts.first;
  //       } else if (boosts.length == 1) {
  //         mentalAtr.wisdom = boosts.first;
  //       }
  //     } else if (char.charClass.mainAtrb == "charisma") {
  //       boosts = identifyBoost(list, "prowess", "superiority", "Headband");
  //       if (boosts.length == 3) {
  //         mentalAtr.intelligence = boosts.first;
  //         mentalAtr.wisdom = boosts.first;
  //         mentalAtr.charisma = boosts.first;
  //       } else if (boosts.length == 2) {
  //         mentalAtr.charisma = boosts.first;
  //         mentalAtr.wisdom = boosts.first;
  //       } else if (boosts.length == 1) {
  //         mentalAtr.charisma = boosts.first;
  //       }
  //     } else {
  //       boosts = identifyBoost(list, "prowess", "superiority", "Headband");
  //       if (boosts.length == 3) {
  //         mentalAtr.intelligence = boosts.first;
  //         mentalAtr.wisdom = boosts.first;
  //         mentalAtr.charisma = boosts.first;
  //       } else if (boosts.length == 2) {
  //         mentalAtr.intelligence = boosts.first;
  //         mentalAtr.wisdom = boosts.first;
  //       } else if (boosts.length == 1) {
  //         mentalAtr.wisdom = boosts.first;
  //       }
  //     }
  //   }
  //   char.baseAtributes.strength += physicalAtr.strength;
  //   char.baseAtributes.dexterity += physicalAtr.dexterity;
  //   char.baseAtributes.constitution += physicalAtr.constitution;
  //   char.baseAtributes.intelligence += mentalAtr.intelligence;
  //   char.baseAtributes.wisdom += mentalAtr.wisdom;
  //   char.baseAtributes.charisma += mentalAtr.charisma;
  //   notifyListeners();
  // }

  // identifyBoost(
  //     List<WonderousItemsModel> list, String dual, String all, String type) {
  //   WonderousItemsModel? boostyItem;
  //   List<int> boosts = [];
  //   for (var i = 0; i < list.length; i++) {
  //     if (list[i].name!.contains(type)) {
  //       boostyItem = list[i];
  //       if (boostyItem.name!.contains(dual)) {
  //         boosts.add(boostyItem.bonus!);
  //         boosts.add(boostyItem.bonus!);
  //       } else if (boostyItem.name!.contains(all)) {
  //         boosts.add(boostyItem.bonus!);
  //         boosts.add(boostyItem.bonus!);
  //         boosts.add(boostyItem.bonus!);
  //       } else {
  //         boosts.add(boostyItem.bonus!);
  //       }
  //       return boosts;
  //     }
  //   }
  // }

  // WonderousItemsModel findTomeOrManual(String atrb) {
  //   List<WonderousItemsModel> list = listOfWonderousItems.manualsAndTomes
  //       .where((element) =>
  //           element.availability <= char.charLevel &&
  //           element.description!.contains(atrb))
  //       .toList();
  //   return list.last;
  // }

  // List<WonderousItemsModel> tomesAndManuals = [];
  // boostWithTomeOrManual() {
  //   if (char.charLevel < 15) {
  //     return;
  //   }
  //   List<WonderousItemsModel> boostBooks = [];
  //   AtributeModel atribute = AtributeModel();
  //   if (char.charLevel > 14 && char.charLevel < 18) {
  //     boostBooks.add(findTomeOrManual(char.charClass.mainAtrb));
  //     boostBooks.add(findTomeOrManual("constitution"));
  //     tomesAndManuals.add(boostBooks.last);
  //     atribute = bosstRightAtributeWithTomeOrManual(
  //         [char.charClass.mainAtrb, "constitution"], boostBooks.last.bonus!, 0);
  //   } else if (char.charLevel > 17 && char.charLevel < 21) {
  //     boostBooks.add(findTomeOrManual(char.charClass.mainAtrb));
  //     boostBooks.add(findTomeOrManual("constitution"));
  //     if ((char.battleStyle.name == "Hybrid" ||
  //             char.battleStyle.name == "Spellcaster") &&
  //         char.charClass.mainAtrb != "dexterity") {
  //       boostBooks.add(findTomeOrManual("dexterity"));
  //       atribute = bosstRightAtributeWithTomeOrManual(
  //           [char.charClass.mainAtrb, "constitution", "dexterity"],
  //           boostBooks.last.bonus!,
  //           0);
  //       tomesAndManuals.add(boostBooks.last);
  //     } else {
  //       boostBooks.add(findTomeOrManual("wisdom"));
  //       atribute = bosstRightAtributeWithTomeOrManual(
  //           [char.charClass.mainAtrb, "constitution", "wisdom"],
  //           boostBooks.last.bonus!,
  //           0);
  //       tomesAndManuals.addAll(boostBooks);
  //     }
  //   }
  //   char.baseAtributes.strength += atribute.strength;
  //   char.baseAtributes.dexterity += atribute.dexterity;
  //   char.baseAtributes.constitution += atribute.constitution;
  //   char.baseAtributes.intelligence += atribute.intelligence;
  //   char.baseAtributes.wisdom += atribute.wisdom;
  //   char.baseAtributes.charisma += atribute.charisma;
  //   notifyListeners();
  // }

  // AtributeModel bosstRightAtributeWithTomeOrManual(
  //     List<String> atrb, int boost, int noBoost) {
  //   AtributeModel atribute = AtributeModel();
  //   atribute.strength = atrb.contains("strength") ? boost : noBoost;
  //   atribute.dexterity = atrb.contains("dexterity") ? boost : noBoost;
  //   atribute.constitution = atrb.contains("constitution") ? boost : noBoost;
  //   atribute.intelligence = atrb.contains("intelligence") ? boost : noBoost;
  //   atribute.wisdom = atrb.contains("wisdom") ? boost : noBoost;
  //   atribute.charisma = atrb.contains("charisma") ? boost : noBoost;
  //   return atribute;
  // }

  //=====================================================================================
  // Modifier part
  calculateAllModifiers() {
    char.modAtributes = abilityCtrl.calculateAllModifiers(char.baseAtributes);
    notifyListeners();
  }
  //   var atributes = char.baseAtributes;
  //   char.modAtributes.strength = calculateModifier(atributes.strength);
  //   char.modAtributes.dexterity = calculateModifier(atributes.dexterity);
  //   char.modAtributes.constitution = calculateModifier(atributes.constitution);
  //   char.modAtributes.intelligence = calculateModifier(atributes.intelligence);
  //   char.modAtributes.wisdom = calculateModifier(atributes.wisdom);
  //   char.modAtributes.charisma = calculateModifier(atributes.charisma);
  //   notifyListeners();
  // }

  // int calculateModifier(int baseValue) {
  //   double doubleValue = baseValue.toDouble();
  //   doubleValue = (doubleValue - 10) / 2;
  //   if (baseValue <= 9 && baseValue >= 8) {
  //     doubleValue = -1;
  //   }
  //   if (baseValue <= 7 && baseValue >= 6) {
  //     doubleValue = -2;
  //   }
  //   return doubleValue.toInt();
  // }
  //=====================================================================================
  // section for hit points generation

  generateHitPoints() {
    char.hitPoints = defense.generateHitPoints(char.charLevel,
        char.modAtributes.constitution, charFeats, char.charClass.hitDice!);
    notifyListeners();
  }

  //   var changeCharInfo = char;
  //   var hitPoints =
  //       changeCharInfo.charLevel * changeCharInfo.modAtributes.constitution;
  //   var diceHitPoints = calculateHipPointsDicePerClass();
  //   var toughness = charFeats.any((element) => element.traiName == "Toughness")
  //       ? char.charLevel
  //       : 0;
  //   hitPoints += diceHitPoints + toughness;
  //   char.hitPoints = hitPoints;
  //   notifyListeners();
  // }

  // int calculateHipPointsDicePerClass() {
  //   var dice = char.charClass.hitDice;
  //   var rollTimes = char.charLevel - 1;
  //   var hitpoints = dice;
  //   if (char.charLevel > 20 && char.charLevel < 26) {
  //     dice = dice! - 3;
  //     for (var i = 0; i < rollTimes; i++) {
  //       var sum = rollingDice(dice) + 3;
  //       hitpoints = hitpoints! + sum;
  //     }
  //   } else if (char.charLevel > 25) {
  //     dice = dice! - 5;
  //     for (var i = 0; i < rollTimes; i++) {
  //       var sum = rollingDice(dice) + 5;
  //       hitpoints = hitpoints! + sum;
  //     }
  //   } else {
  //     for (var i = 0; i < rollTimes; i++) {
  //       hitpoints = hitpoints! + rollingDice(dice!);
  //     }
  //   }
  //   return hitpoints!;
  // }

//=======================================================================================

// section to generate Ac defense
  // int findBoostyItem(int level, List<WonderousItemsModel> list, String name) {
  //   WonderousItemsModel itemBoost;
  //   var boost = 0;
  //   if (level > 2) {
  //     itemBoost = list.firstWhere((element) => element.name!.contains(name));
  //     boost = itemBoost.bonus!;
  //   }
  //   return boost;
  // }

  claculatingHitDefense() {
    char.combatStats.armourClass = defense.claculatingHitDefense(
        char.charEquip,
        char.charLevel,
        char.modAtributes.dexterity,
        char.charRace,
        char.charClass.name,
        char.modAtributes.wisdom,
        char.charEquip.wonderousItems!,
        charFeats,
        true,
        false,
        false);
    char.combatStats.armourSurprise = defense.claculatingHitDefense(
        char.charEquip,
        char.charLevel,
        char.modAtributes.dexterity,
        char.charRace,
        char.charClass.name,
        char.modAtributes.wisdom,
        char.charEquip.wonderousItems!,
        charFeats,
        false,
        true,
        false);
    char.combatStats.armourTouch = defense.claculatingHitDefense(
      char.charEquip,
      char.charLevel,
      char.modAtributes.dexterity,
      char.charRace,
      char.charClass.name,
      char.modAtributes.wisdom,
      char.charEquip.wonderousItems!,
      charFeats,
      false,
      false,
      true,
    );
    notifyListeners();
  }

  //   int armorDefense =
  //       char.charEquip.armour != null ? char.charEquip.armour!.defenseBonus : 0;
  //   int shieldDefense =
  //       char.charEquip.shield != null ? char.charEquip.shield!.defenseBonus : 0;
  //   int maxDex = char.charEquip.armour != null
  //       ? char.charEquip.armour!.maxDexAllowed
  //       : 0;
  //   if (maxDex < char.modAtributes.dexterity) {
  //     char.modAtributes.dexterity = maxDex;
  //   }
  //   int armorAc = 0;
  //   int touch = 0;
  //   int surprise = 0;
  //   armorAc = 10 + armorDefense + shieldDefense + char.modAtributes.dexterity;
  //   touch = 10 + char.modAtributes.dexterity;
  //   surprise = 10 + armorDefense + shieldDefense;
  //   if (char.charRace.size == "Small") {
  //     armorAc++;
  //     touch++;
  //     surprise++;
  //   }
  //   if (char.charRace.name == "Monk") {
  //     armorAc += char.modAtributes.wisdom;
  //     touch += char.modAtributes.wisdom;
  //     surprise += char.modAtributes.wisdom;
  //   }
  //   var ringBoost = findBoostyItem(
  //       char.charLevel, char.charEquip.wonderousItems!, "Ring of protection");
  //   armorAc += ringBoost;
  //   touch += ringBoost;
  //   surprise += ringBoost;
  //   var amuletBoost = findBoostyItem(char.charLevel,
  //       char.charEquip.wonderousItems!, "Amulet of natural armor");
  //   armorAc += amuletBoost;
  //   touch += amuletBoost;
  //   surprise += amuletBoost;
  //   if (char.charEquip.wonderousItems!
  //       .any((element) => element.name == "Vambraces of defense")) {
  //     armorAc++;
  //     surprise++;
  //   }

  //   //boost from mandatory iounstone for AC
  //   armorAc += char.charLevel > 9 ? 1 : 0;
  //   surprise += char.charLevel > 9 ? 1 : 0;
  //   touch += char.charLevel > 9 ? 1 : 0;

  //   char.combatStats.armourClass = armorAc;
  //   char.combatStats.armourTouch = touch;
  //   char.combatStats.armourSurprise = surprise;
  //   notifyListeners();
  // }
//======================================================================================
// section to generate Ac defense

  calculateResistances() {
    ResistanceModel resists = defense.calculateResistances(
        listOfClasses.goodOrBad,
        char.charLevel,
        char.charClass.resistUpgrade!,
        char.charRace.name,
        char.charClass.name,
        charFeats,
        char.modAtributes,
        char.charEquip.wonderousItems!);
    char.resistances = resists;
    notifyListeners();
  }

  //   ResistanceModel resists = ResistanceModel();
  //   int partialFort = 0;
  //   int partialRef = 0;
  //   int partialWill = 0;
  //   var bonusAtLevel = listOfClasses.goodOrBad[char.charLevel - 1];
  //   switch (char.charClass.resistUpgrade) {
  //     case "fort":
  //       partialFort = bonusAtLevel.good;
  //       partialRef = bonusAtLevel.bad;
  //       partialWill = bonusAtLevel.bad;
  //       break;
  //     case "ref":
  //       partialFort = bonusAtLevel.bad;
  //       partialRef = bonusAtLevel.good;
  //       partialWill = bonusAtLevel.bad;
  //       break;
  //     case "will":
  //       partialFort = bonusAtLevel.bad;
  //       partialRef = bonusAtLevel.bad;
  //       partialWill = bonusAtLevel.good;
  //       break;
  //     case "fort, will":
  //       partialFort = bonusAtLevel.good;
  //       partialRef = bonusAtLevel.bad;
  //       partialWill = bonusAtLevel.good;
  //       break;
  //     case "fort, ref":
  //       partialFort = bonusAtLevel.good;
  //       partialRef = bonusAtLevel.good;
  //       partialWill = bonusAtLevel.bad;
  //       break;
  //     case "ref, will":
  //       partialFort = bonusAtLevel.bad;
  //       partialRef = bonusAtLevel.good;
  //       partialWill = bonusAtLevel.good;
  //       break;
  //     case "all":
  //       partialFort = bonusAtLevel.good;
  //       partialRef = bonusAtLevel.good;
  //       partialWill = bonusAtLevel.good;
  //       break;
  //     default:
  //   }
  //   if (char.charRace.name == "Hafling") {
  //     partialFort += 1;
  //     partialRef += 1;
  //     partialWill += 1;
  //   }
  //   if (char.charClass.name == "Paladin" ||
  //       char.charClass.name == "Antipaladin") {
  //     var caris = char.modAtributes.charisma;
  //     partialFort += caris;
  //     partialWill += caris;
  //     partialRef += caris;
  //   }
  //   if (charFeats.any((element) => element.traiName == "Iron Will")) {
  //     partialWill += 2;
  //   }
  //   if (charFeats.any((element) => element.traiName == "Great Fortitude")) {
  //     partialFort += 2;
  //   }
  //   if (charFeats.any((element) => element.traiName == "Lightning Reflexes")) {
  //     partialRef += 2;
  //   }

  //   var boost = findBoostyItem(
  //       char.charLevel, char.charEquip.wonderousItems!, "Cloak of resistance");
  //   resists.fortitude = partialFort + char.modAtributes.constitution + boost;
  //   resists.reflex = partialRef + char.modAtributes.dexterity + boost;
  //   resists.will = partialWill + char.modAtributes.wisdom + boost;

  //   char.resistances = resists;
  //   notifyListeners();
  // }

// ====================================================================================

// section to generate combat manouver modifiers

  calculateCombatManeuvers() {
    char.combatStats.combatManeuverBonus = offense.calculateCombatManeuvers(
        char.combatStats.baseAttackBonus!,
        char.modAtributes,
        char.charRace.name,
        charFeats,
        char.charLevel,
        true);
    char.combatStats.combatManeuverDefense = offense.calculateCombatManeuvers(
        char.combatStats.baseAttackBonus!,
        char.modAtributes,
        char.charRace.name,
        charFeats,
        char.charLevel,
        false);
    notifyListeners();
  }
  //   var bAttackBonus = char.combatStats.baseAttackBonus;
  //   var atributes = char.modAtributes;
  //   var cmb = 0;
  //   var cmd = 0;
  //   cmb = bAttackBonus! + atributes.strength;
  //   cmd = bAttackBonus + atributes.strength + atributes.dexterity + 10;
  //   if (char.charRace.size == "Small") {
  //     cmb -= 1;
  //     cmd -= 1;
  //   }
  //   char.combatStats.combatManeuverBonus = cmb;
  //   char.combatStats.combatManeuverDefense = cmd;
  //   notifyListeners();
  // }
// ====================================================================================

// section to generate Initiative

  gettingInitiative() {
    char.combatStats.initiative =
        offense.gettingInitiative(charFeats, char.modAtributes.dexterity);
    notifyListeners();
  }
  //   //Reactionary points
  //   int init = 2;
  //   init = char.feats.any((element) => element.traiName == "Initiative")
  //       ? init += 4
  //       : init;
  //   init += char.modAtributes.dexterity;
  //   char.combatStats.initiative = init;
  //   notifyListeners();
  // }

  //=====================================================================================
  // Section for calculating Attack and Damage

  // int boostWeaponWithFeat(int melee, int range) {
  //   if (char.physicalStyle.name != "Bowman" ||
  //       char.physicalStyle.name != "Marksman" ||
  //       char.physicalStyle.name != "Thrower") {
  //     return melee;
  //   } else {
  //     return range;
  //   }
  // }

  calculatingPhysicalAttackAndDamage() {
    char.combatStats.meleeAttack = offense.calculatingPhysicalAttack(
        char.charClass.mainAtrb,
        char.modAtributes,
        char.combatStats.baseAttackBonus!,
        charFeats,
        char.physicalStyle.name,
        char.charLevel,
        char.charEquip.meleeWeapon!.enchantment![0].power,
        char.charEquip.rangeWeapon!.enchantment![0].power,
        true);
    char.combatStats.rangeAttack = offense.calculatingPhysicalAttack(
        char.charClass.mainAtrb,
        char.modAtributes,
        char.combatStats.baseAttackBonus!,
        charFeats,
        char.physicalStyle.name,
        char.charLevel,
        char.charEquip.meleeWeapon!.enchantment![0].power,
        char.charEquip.rangeWeapon!.enchantment![0].power,
        false);
    char.combatStats.meleeDamage = offense.calculatingPhysicalDamage(
        char.charClass.mainAtrb,
        char.modAtributes,
        charFeats,
        char.physicalStyle.name,
        char.charLevel,
        char.charEquip.meleeWeapon!.enchantment![0].power,
        char.charEquip.rangeWeapon!.enchantment![0].power,
        true);
    char.combatStats.rangeDamage = offense.calculatingPhysicalDamage(
        char.charClass.mainAtrb,
        char.modAtributes,
        charFeats,
        char.physicalStyle.name,
        char.charLevel,
        char.charEquip.meleeWeapon!.enchantment![0].power,
        char.charEquip.rangeWeapon!.enchantment![0].power,
        false);
  }
  //   String meleeAtk = "";
  //   int meleeAtkNum = 0;
  //   String rangeAtk = "";
  //   int rangeAtkNum = 0;
  //   int strOrWis = char.charClass.mainAtrb == "wisdom"
  //       ? char.modAtributes.wisdom
  //       : char.modAtributes.strength;
  //   int bba = char.combatStats.baseAttackBonus!;
  //   if (charFeats.any((element) => element.traiName == "Weapon Finesse")) {
  //     meleeAtkNum += char.modAtributes.dexterity + bba;
  //   } else {
  //     meleeAtkNum += strOrWis + bba;
  //   }
  //   rangeAtkNum += char.modAtributes.dexterity + bba;
  //   if (char.charLevel == 3 || char.charLevel == 4) {
  //     meleeAtkNum++;
  //     rangeAtkNum++;
  //   } else if (char.charLevel > 4) {
  //     meleeAtkNum += char.charEquip.meleeWeapon!.enchantment![0].power;
  //     rangeAtkNum += char.charEquip.rangeWeapon!.enchantment![0].power;
  //   }
  //   if (charFeats.any((element) => element.traiName == "Weapon Focus")) {
  //     meleeAtkNum += boostWeaponWithFeat(1, 0);
  //     rangeAtkNum += boostWeaponWithFeat(0, 1);
  //   }
  //   if (charFeats
  //       .any((element) => element.traiName == "Greater Weapon Focus")) {
  //     meleeAtkNum += boostWeaponWithFeat(1, 0);
  //     rangeAtkNum += boostWeaponWithFeat(0, 1);
  //   }

  //   if (bba < 6) {
  //     meleeAtk = "+$meleeAtkNum";
  //     rangeAtk = "+$rangeAtkNum";
  //   } else if (bba > 5 && bba < 11) {
  //     meleeAtk = "+$meleeAtkNum / +${meleeAtkNum - 5}";
  //     rangeAtk = "+$rangeAtkNum / +${rangeAtkNum - 5}";
  //   } else if (bba > 10 && bba < 16) {
  //     meleeAtk = "+$meleeAtkNum / +${meleeAtkNum - 5} / +${meleeAtkNum - 10}";
  //     rangeAtk = "+$rangeAtkNum / +${rangeAtkNum - 5} / +${rangeAtkNum - 10}";
  //   } else {
  //     meleeAtk =
  //         "+$meleeAtkNum / +${meleeAtkNum - 5} / +${meleeAtkNum - 10} / +${meleeAtkNum - 15}";
  //     rangeAtk =
  //         "+$rangeAtkNum / +${rangeAtkNum - 5} / +${rangeAtkNum - 10} / +${rangeAtkNum - 15}";
  //   }
  //   int meleeDamage = 0;
  //   int rangeDamage = 0;
  //   if (char.charLevel > 4) {
  //     meleeDamage += char.modAtributes.strength +
  //         char.charEquip.meleeWeapon!.enchantment![0].power;
  //     rangeDamage += char.modAtributes.strength +
  //         char.charEquip.rangeWeapon!.enchantment![0].power;
  //   } else {
  //     meleeDamage += char.modAtributes.strength;
  //     rangeDamage += char.modAtributes.strength;
  //   }
  //   if (char.physicalStyle.name == "Berserker") {
  //     meleeDamage = (meleeDamage * 1.5).floor();
  //   }
  //   if (charFeats
  //       .any((element) => element.traiName == "Weapon Specialization")) {
  //     meleeDamage += boostWeaponWithFeat(2, 0);
  //     rangeDamage += boostWeaponWithFeat(0, 2);
  //   }
  //   if (charFeats.any(
  //       (element) => element.traiName == "Greater Weapon Specialization")) {
  //     meleeDamage += boostWeaponWithFeat(2, 0);
  //     rangeDamage += boostWeaponWithFeat(0, 2);
  //   }
  //   char.combatStats.meleeAttack = meleeAtk;
  //   char.combatStats.rangeAttack = rangeAtk;
  //   char.combatStats.meleeDamage = "$meleeDamage";
  //   char.combatStats.rangeDamage = "$rangeDamage";
  //   notifyListeners();
  // }

  calculateClassSkills() {
    List<SkillModel> charSkillList = skillData.skills;
    for (var i in charSkillList) {
      i.finalValue = 0;
      i.atrbValue = 0;
      i.checkPenalty = 0;
      i.pointsAdded = 0;
    }
    List<SkillModel> classSkills = charSkillList
        .where(
            (element) => element.skillOfClasses.contains(char.charClass.name))
        .toList();
    for (var i in classSkills) {
      i.initialClassSkill = true;
    }
    int skillRankPerLevel =
        char.charClass.skillRankPerLevel + char.modAtributes.intelligence;
    int maxSkills = skillRankPerLevel * char.charLevel;
    int unUsedRankPoints = 0;
    for (var i = 0; i < maxSkills; i++) {
      var random = generateRandom(classSkills.length);
      classSkills[random].pointsAdded++;
    }
    for (var i = 0; i < classSkills.length; i++) {
      if (classSkills[i].pointsAdded > char.charLevel) {
        unUsedRankPoints += classSkills[i].pointsAdded - char.charLevel;
      }
    }

    charSkillList.removeWhere(
        (element) => element.skillOfClasses.contains(char.charClass.name));
    if (unUsedRankPoints > 0) {
      for (var j = 0; j < maxSkills; j++) {
        var random = generateRandom(charSkillList.length);
        if (charSkillList[random].pointsAdded >= char.charLevel) {
          charSkillList[random].pointsAdded = char.charLevel;
          maxSkills++;
        }
        charSkillList[random].pointsAdded++;
        maxSkills <= 0 ? 0 : maxSkills--;
      }
    }
    for (var j = 0; j < classSkills.length; j++) {
      classSkills[j].pointsAdded + 3;
    }
    charSkillList.addAll(classSkills);
    charSkillList.sort((a, b) => a.name.compareTo(b.name));

    for (var i in charSkillList) {
      switch (i.atributeUsed) {
        case "strength":
          i.finalValue += i.pointsAdded + char.modAtributes.strength;
          i.atrbValue += char.modAtributes.strength;
          break;
        case "dexterity":
          i.finalValue += i.pointsAdded + char.modAtributes.dexterity;
          i.atrbValue += char.modAtributes.dexterity;
          break;
        case "intelligence":
          i.finalValue += i.pointsAdded + char.modAtributes.intelligence;
          i.atrbValue += char.modAtributes.intelligence;
          break;
        case "wisdom":
          i.finalValue += i.pointsAdded + char.modAtributes.wisdom;
          i.atrbValue += char.modAtributes.wisdom;
          break;
        default:
          i.finalValue += i.pointsAdded + char.modAtributes.charisma;
          i.atrbValue += char.modAtributes.charisma;
      }
    }
    int penalty =
        char.charEquip.armour != null ? char.charEquip.armour!.checkPenalty : 0;
    penalty +=
        char.charEquip.shield != null ? char.charEquip.shield!.checkPenalty : 0;

    for (var i
        in charSkillList.where((element) => element.hasPenalty == true)) {
      i.checkPenalty = penalty;
      i.finalValue -= penalty;
    }
    charSkills = charSkillList;
    notifyListeners();
  }
}
